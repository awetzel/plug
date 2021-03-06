defmodule Plug.Session.Store do
  @moduledoc """
  Specification for session stores.
  """
  use Behaviour

  @type sid :: term | nil
  @type cookie :: binary
  @type session :: map

  @moduledoc """
  Initializes the store.

  The options returned from this function will be given
  to `get/3`, `put/4` and `delete/3`.
  """
  defcallback init(Plug.opts) :: Plug.opts

  @moduledoc """
  Parses the given cookie.

  Returns a session id and the session contents. The session id is any
  value that can be used to identify the session by the store.

  The session id may be nil in case the cookie does not identify any
  value in the store. The session contents must be a map.
  """
  defcallback get(Plug.Conn.t, cookie, Plug.opts) :: {sid, session}

  @moduledoc """
  Stores the session associated with given session id.

  If `nil` is given as id, a new session id should be
  generated and returned.
  """
  defcallback put(Plug.Conn.t, sid, any, Plug.opts) :: cookie

  @moduledoc """
  Removes the session associated with given session id from the store.
  """
  defcallback delete(Plug.Conn.t, sid, Plug.opts) :: :ok
end
