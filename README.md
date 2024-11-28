# Trunk based development workflow

## Introduction

Trunk-based development is a version control management practice where developers integrate small, frequent updates into a core "trunk" or main branch.  This approach is widely adopted by DevOps teams to streamline marging and integration phases, facilitating continuous integration and continuous delivery (CI/CD).

## Key Consepts

1. **Single Source of Truth**:  The trunk serves as the single source of truth for the codebase.  All changes are made directly to this branch, minimizing the risk of divergence and simplifying the integration process.
2. **Short-Lived Branches**:  If branches are used, they are kep short-lived -- typically no longer than a day or two.  This encourages developers to integrate their changes back into the trunk quickly, reducing merge conflicts and facilitating faster feedback.
3. **Continuous Integration and Delivery (CI/CD)**:  Trunk-based development relies heavily on CI?CD practices.  Automated tests run on each change to keep the codebase stable and deploy features quickly.

## Workflow

1. **Feature Branch Creation**:
   - A developer creates a feature branch from the `main` branch.
2. **Development**:
   - The developer commits changes to the feature branch.
3. **Pull Request**:
   - The developer creates a pull request targeting the main branch.
4. **Initial Testing**:
   - Upon creation of the feature branch, a workflow automation runs unit and feature tests but does not deploy.
5. **Continuous Testing**:
   - For every change committed to the pull request, unit and feature tests are run.
6. **Code Review and Merge**:
   - Pull requests are reviewed and, if approved, are squashed and marged into the main branch.
7. **Post-Merge Automation**:
   - For every merge to the main branch, workflow automation runs unit and feature tests, deploys to a testing environment, performs integration tests, and reports back to the project management system all changes since the last release.  It also predicts the next release version and reports all changes made since the last release.
8. **Production Deployment**:
   - To deploy to production, developers create a GitHub release, which triggers a workflow automation that builds and deplys to production.

## Benefits

- **Simplified Merging**:  Frequent integration reductes the likelihood of merge conflicts.
- **Faster Feedback**:  Immediate availability of changes for testing and feedback.
- **Cleaner History**:  A liniear commit history makes it easier to understand the evolution of the codebase.
- **Improved Collaboration**:  Developers work closely together, fostering better communication and teamwork.
