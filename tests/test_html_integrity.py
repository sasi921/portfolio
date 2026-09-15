"""Lightweight integrity checks for the static portfolio.

Uses only the Python standard library so contributors and CI can run the checks
without installing project dependencies.
"""
from html.parser import HTMLParser
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
INDEX = ROOT / "index.html"


class PortfolioParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.ids = []
        self.internal_links = []
        self.images_without_alt = []
        self.blank_links_without_rel = []

    def handle_starttag(self, tag, attrs):
        attributes = dict(attrs)

        element_id = attributes.get("id")
        if element_id:
            self.ids.append(element_id)

        if tag == "a":
            href = attributes.get("href", "")
            if href.startswith("#") and len(href) > 1:
                self.internal_links.append(href[1:])

            if attributes.get("target") == "_blank":
                rel = set(attributes.get("rel", "").split())
                if "noreferrer" not in rel and "noopener" not in rel:
                    self.blank_links_without_rel.append(href)

        if tag == "img" and not attributes.get("alt", "").strip():
            self.images_without_alt.append(attributes.get("src", "<unknown>"))


class PortfolioIntegrityTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.parser = PortfolioParser()
        cls.parser.feed(INDEX.read_text(encoding="utf-8"))

    def test_document_has_no_duplicate_ids(self):
        duplicates = sorted({item for item in self.parser.ids if self.parser.ids.count(item) > 1})
        self.assertEqual([], duplicates, f"Duplicate HTML ids: {duplicates}")

    def test_internal_links_point_to_existing_sections(self):
        missing = sorted(set(self.parser.internal_links) - set(self.parser.ids))
        self.assertEqual([], missing, f"Internal links without matching ids: {missing}")

    def test_images_have_alt_text(self):
        self.assertEqual([], self.parser.images_without_alt, f"Images without alt text: {self.parser.images_without_alt}")

    def test_new_tab_links_are_hardened(self):
        self.assertEqual(
            [],
            self.parser.blank_links_without_rel,
            f"target=_blank links missing noopener/noreferrer: {self.parser.blank_links_without_rel}",
        )


if __name__ == "__main__":
    unittest.main()
