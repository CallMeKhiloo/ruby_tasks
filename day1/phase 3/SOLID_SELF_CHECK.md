# SOLID Self-Check

- [x] **S** — Each class has exactly one reason to change.
  - `ConsoleHandler` only changes if terminal output format changes.
  - `FileHandler` only changes if file-writing behavior changes.
  - `StatsHandler` only changes if the summary format changes.
  - `EventRouter` only changes if dispatch logic changes.
  - The menu in `life_track.rb` only changes if the CLI UX changes.

- [x] **O** — The third output (`StatsHandler`) was added by creating one new file (`stats_handler.rb`)
  and registering it in the entry point. The router was **not opened**.

- [x] **L** — Any handler can be removed from or swapped in the registered list and the router
  still works without modification. `ConsoleHandler`, `FileHandler`, and `StatsHandler` are
  interchangeable from the router's point of view.

- [x] **I** — `Handler` has exactly **one** method: `#handle(event)`. No output is forced to
  implement anything it doesn't use.

- [x] **D** — Search `event_router.rb` for any concrete class name (`ConsoleHandler`,
  `FileHandler`, `StatsHandler`). Result: **zero**. The router depends only on the `Handler`
  abstraction.
