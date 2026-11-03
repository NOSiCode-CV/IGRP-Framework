# CLAUDE.md — IGRP

Context recovered from the previous Codex sessions on this project (Oct 2026). No `AGENTS.md` exists here; if one is added, read it first.

## Project
- Java web application (WAR, Maven), artifact `IGRP`, compiled with Java 17 (`maven.compiler.release` in `pom.xml`).
- Runs locally at `http://localhost:8089/IGRP/`; the IGRP Studio app is reached with `?dad=igrp_studio`.
- Code lives under `src/main/java/nosi/webapps/igrp/...` (controllers such as `SettingsController`, `GestaodeacessoController`, `WebReportController`).

## Branches and copies
- Main checkout: `C:\Users\marcos.m.brito\IdeaProjects\igrp-web-framework`, branch `igrp-horizon-dev`.
- A second copy at `C:\Users\marcos.m.brito\Cursor Work\igrp-web-framework` follows `develop` and uses **Java 8 and `javax.servlet`**. When the user says "do the same in the develop folder", port the change there and adapt it to Java 8 (no Java 9+ APIs).
- The old nested `develop` worktree was dropped on purpose; do not recreate it.

## Build and test
- Compile: `mvn -q -DskipTests compile`
- Focused tests: `mvn -q -Dtest=ActivitiProcessAvailabilityTest test`, `mvn -Dtest=ReportPreviewTransformTest test`
- Prefer running only the tests for the touched area. Changes are not visible in the browser until the app is restarted/redeployed; say so when it matters, and state plainly what was not verified in the browser.

## Conventions and decisions seen in past work
- Activiti availability checks (used to hide "Associar etapa" in Gestão de Acesso): short connect timeout; successful result cached 5 minutes, failed/empty result cached 30 seconds; the button is hidden by default until a check succeeds. See `ActivitiProcessAvailability`.
- Image URLs for user signature/photo include the user's update timestamp so browsers do not show a cached image after replacement.
- Report preview renders XSLT on the server and returns HTML (`ReportPreviewTransformTest` covers it).
- The user writes in English and Portuguese; answer in the language used.
- Commit messages follow `vX.Y.Z.YYMMDD: <what changed>` (see `git log`).
