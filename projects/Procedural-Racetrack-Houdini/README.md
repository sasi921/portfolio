# Procedural Racetrack Environment in Houdini

A procedural 3D environment project created in **Houdini Non-Commercial**. The scene generates a customizable racetrack integrated with terrain, barriers, track markings, and procedurally scattered trees.

## Overview

The goal of this project is to demonstrate Houdini's node-based procedural modeling workflow by building a racetrack environment whose major components can be adjusted without rebuilding the scene from scratch.

The project covers:

- Procedural terrain generation with hills and valleys
- Custom racetrack creation from curves
- Sweep-based track geometry generation
- UV preparation and track markings
- Procedural barrier placement along track edges
- Tree scattering and instancing across the terrain
- Attribute, color, normal, and smoothing adjustments
- Final scene integration for rendering

## Workflow

### 1. Terrain Generation

A **Grid** node creates the base terrain. A **Mountain** node deforms the grid to produce hills and valleys. Height and frequency parameters control terrain amplitude and surface variation.

### 2. Racetrack Creation

Two curves define the racetrack path and boundaries. A **Sweep** node extrudes track geometry along the curve using a rectangular cross-section. UV nodes prepare the track for asphalt and lane-marking materials.

### 3. Barrier Placement

The pre-modeled `barrier.bgeo` asset is imported and positioned along the track edges. Auxiliary curves, Sweep operations, and grouping are used to keep barriers aligned with the racetrack curvature. Selected sections can be controlled and colored independently before the barriers are merged into the scene.

### 4. Tree Placement

Two tree assets, `firtreeA.bgeo` and `firtreeB.bgeo`, are scattered across the terrain. **Scatter**, **AttribTransfer**, and **Copy to Points** nodes control distribution and instancing. Transform operations introduce scale and rotation variation so the forest appears less repetitive.

### 5. Landscape Details

Auxiliary curves, Add, and Resample nodes generate repeating track and boundary markings. Attributes such as `Cd` and forest-density values are adjusted to improve rendering and procedural control.

### 6. Final Integration

Terrain, racetrack, barriers, and trees are combined with Merge nodes. A Normal node improves shading, and smoothing is applied where needed. Cameras, lights, and materials are prepared for rendering, with Karma listed as the intended Houdini render engine in the project report.

## Project Files

The original project source supplied for this work contains:

```text
racetrack.hipnc
geo/
├── barrier.bgeo
├── firtreeA.bgeo
├── firtreeB.bgeo
└── tire.bgeo
```

The `.hipnc` and `.bgeo` files are Houdini binary files. The connected GitHub publishing interface used for this update supports reliable text-file writes but not direct binary attachment transfer, so the source binaries are maintained as a separate source package rather than risking corruption.

The GitHub-viewable documentation is available at:

- [`docs/Project-Final-Report.md`](docs/Project-Final-Report.md)

## Opening the Source Package

1. Install a compatible version of **SideFX Houdini Non-Commercial / Apprentice**.
2. Extract the supplied source package.
3. Open `racetrack.hipnc` in Houdini.
4. Keep the `.bgeo` assets alongside the project in the expected `geo` location.
5. If file paths differ on your system, update the relevant Houdini File nodes.

## Results

The completed environment includes:

- A customizable procedural racetrack with lane markings
- Natural terrain with hills and valleys integrated around the track
- Barriers procedurally aligned with the racetrack edges
- Forest areas generated through point scattering and geometry instancing

## Skills Demonstrated

`Houdini` · `Procedural Modeling` · `Node-Based Workflows` · `Terrain Generation` · `Geometry Instancing` · `Point Scattering` · `UV Mapping` · `3D Environment Design`

## Author

**Sasidhar Reddy Velkuri**

---

This academic project demonstrates a modular approach to creating reusable racetrack environments in Houdini.