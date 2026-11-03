# CLAUDE.md — IGRP (develop)

Context recovered from the previous Codex sessions. No `AGENTS.md` exists here; if one is added, read it first.

## Project
- Java web application (WAR, Maven), artifact `IGRP`, branch `develop`.
- **Java 8 and `javax.servlet`** (`maven.compiler.source/target` 1.8). Do not use Java 9+ APIs or `jakarta.*`.
- Runs locally at `http://localhost:8089/IGRP/`; the IGRP Studio app is reached with `?dad=igrp_studio`.

## Relation to the main copy
- The main checkout is `C:\Users\marcos.m.brito\IdeaProjects\igrp-web-framework\IGRP` (branch `igrp-horizon-dev`, Java 17). It has its own `CLAUDE.md` with conventions and past decisions.
- Fixes are usually made there first and then ported here, adapted to Java 8 (for example the server-side XSLT report preview in `WebReportController`).

## Build and test
- Compile: `mvn -q -DskipTests compile`
- Focused tests: `mvn -Dtest=<TestClass> test`
- Changes are not visible in the browser until the app is redeployed; say so, and state plainly what was not verified in the browser.

## Conventions
- The user writes in English and Portuguese; answer in the language used.
- Commit messages follow `vX.Y.Z.YYMMDD: <what changed>` (see `git log`).
