# Generic CV

This repository is the public publication frontend for the generic English CV.
It intentionally contains only the generic TeX publication layer. Tailored
variants, evidence records, and career-source material are maintained in the
private source repository.

Build locally with Nix:

```bash
nix build .#cv
```

Version tags (`v*`) build and publish `cv.pdf` as a GitHub release asset. Pull
requests and pushes to `trunk` build the PDF as an integrity check.
