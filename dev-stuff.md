Dev Stuff
---------

Links to strategies that can improve development process within teams.

## Commit message
- https://cbea.ms/git-commit/#seven-rules
- https://www.conventionalcommits.org/en/v1.0.0/

A properly formed Git commit subject line should always be able to complete the following sentence:
_If applied, this commit will_ **your subject line here**.

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Pull Requests
https://martinfowler.com/articles/ship-show-ask.html

Ship/Show/Ask is a branching strategy that combines the features of Pull Requests with the ability to keep shipping changes.
Changes are categorized as either:
- Ship: **merge** into mainline without review,
- Show: **merge then review**, open a pull request for review, but merge into mainline immediately, or
- Ask:  **review then merge**, open a pull request for discussion before merging.

## Code Reviews
- https://en.wikipedia.org/wiki/Code_review
- https://github.com/google/eng-practices
First, developers must be able to make progress on their tasks.
**In general, reviewers should favor approving a change once it is in a state where it definitely improves the overall code health of the system being worked on, even if the CL isn't perfect.**

## Comments
- https://conventionalcomments.org/

Format: Adhering to a consistent format improves reader's expectations and machine readability.
```
<label> [decorations]: <subject>

[discussion]
```

- label - This is a single label that signifies what kind of comment is being left.
- subject - This is the main message of the comment.
- decorations (optional) - These are extra decorating labels for the comment. They are surrounded by parentheses and comma-separated.
- discussion (optional) - This contains supporting statements, context, reasoning, and anything else to help communicate the “why” and “next steps” for resolving the comment.

