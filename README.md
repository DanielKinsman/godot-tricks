# godot-tricks
Plugins, tricks, and hacks for doing various things in the godot engine

## FlippablePhysics2D
For working around the fact that you can't easily "flip" or "mirror" physics bodies like RigidBody2D. It works via rotating and translating children of such nodes instead of mirroring them via `scale(-1, 1)`.

As such it has several limitations, primarily that it only works for symmetrical children like a `CollisionShape2D` with a `RectangleShape2D` property, not one with an asymetrical hand drawn `ConvexPolygonShape2D`.

To use it, copy the files into your project (or better yet, `git submodule add` it from [here](https://github.com/DanielKinsman/godot-flippable-physics)), then change the `extends RigidBody2D` in your node's script to `extends "godot-flippable-physics/FlippablePhysics2D.gd".FlippableRigidBody2D`. See the example project inside.

## Lazy input settings

An ugly but quick way of putting user reconfiguration of inputs (keyboard, mouse, joystick) into your project.

![screenshot](lazy_input_settings/addons/godot-lazy-input-settings/screenshot.png)

![screenshot2](lazy_input_settings/addons/godot-lazy-input-settings/screenshot2.png)

Just install it as a plugin and drop a InputMenu node into any scene and it will create a menu allowing reconfiguraiton of any input actions your project defines. The config is persisted to `user://input_map.json`. Load it on startup by doing this:

    const InputMenu = preload("addons/godot-lazy-input-settings/input_menu.gd")
    ...
    InputMenu.load_input_map_from_file("user://input_map.json")

To make the "default" button work properly, save a `input_map.json` to `res://default_input_map.json`.
