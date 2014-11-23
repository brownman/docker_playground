[installing_ci_runner](https://gitlab.com/gitlab-org/gitlab-ci-runner/blob/master/README.md)
===

dir structure:
----
- PUBLIC/ - should not contain any private info (TOKENS, etc)
- PRIVATE/ - just copy and paste successful shell messages.


ORDER:
====

install linux packages + ruby
------
- install linux deps
- install ruby: patch it , then compile it 


store some ENV variables:
-------
- edit ~/config.cfg: add required env vars
- export env vars using: source ~/config.cfg (we don't want to commit those vars)


register the runner on the C.I server:
------
- using vars:  REGISTRATION_TOKEN + C.I DOMAIN NAME
- switch user to gitlab_ci_runner
- go to his home,
- in not exist: clone a the git repo: gitlab-ci-runner
- cd into gitlab-ci-runner
- run some scripts..

finally
----
- update runner if needed
- run the runner service
