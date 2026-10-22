---
name: igrp-generated-java-protected-zones
description: Preserve custom code when creating or editing generator-managed IGRP Java controllers. Use for changes to IGRP action methods, controller imports, or controller helper methods.
---

# IGRP Generated Java Protected Zones

IGRP regenerates controller code outside its protected code blocks. Never place custom application logic in generator-owned regions, even when the resulting Java compiles.

- Put action-specific code between that action's matching markers. For example, code added to `actionIndex` belongs inside `/*----#start-code(index)----*/` and `/*----#end-code----*/`; code added to `actionPesquisar` belongs inside its `pesquisar` block.
- Keep the generated action setup before the start marker and the generated render/return code after the end marker unchanged unless the generator itself is being modified.
- Put custom imports only in `packages_import` (or the applicable protected import block).
- Put a shared controller helper in `custom_actions` only when it genuinely serves multiple actions. Keep logic used by one action inside that action's protected block.
- Before finishing, inspect the diff and verify every custom addition is enclosed by the appropriate protected markers.
