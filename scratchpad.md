# ExTwitch

A client implementation for the new Twitch API

## DOING

## TODO

- where we have to put the `clientId` and `secret` information
- how to deal with the OAuth token?
  - should be the client that creates it for us?
  - what to do when the token expires?
- understand how other wrote client implementation for external APIs
- think about move the `API` module out from the `ExTwitch` top level module
- [?] what is `formatter.exs`

## DONE

- write a first `README.md` for the project
- implement the [users](https://dev.twitch.tv/docs/api/reference/#get-users) API
- `/users` handle both `login` and `id` fields
- `/users` handle more than one `field` id
- `/users` handle the `id` field
- `/users` handle more than one `login` field
- how to make http request with Elixir (are there good http libraries)
- how to deal with the authentication, tokens, etc ...
- take a look at the documentation of the [new Twitch API](https://dev.twitch.tv/docs/api/
  - to understand from which API feature we could start
- create an empty mix project and commit
- create a github repository
