[installing_ci_runner](https://gitlab.com/gitlab-org/gitlab-ci-runner/blob/master/README.md)
===

dir structure:
----
- PUBLIC/ - should not contain any private info (TOKENS, etc)
- PRIVATE/ - just copy and paste successful shell messages.


ORDER:
-----
- install linux deps
- install ruby: patch it , then compile it 

- edit ~/config.cfg: add required env vars
- export env vars using: source ~/config.cfg (we don't want to commit those vars)

- switch user to gitlab_ci_runner
- go to his home, clone a git repo
- install required gems

- run the service
- update runner if needed
