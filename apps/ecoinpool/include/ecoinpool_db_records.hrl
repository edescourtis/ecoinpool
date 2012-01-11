
%%
%% Copyright (C) 2011  Patrick "p2k" Schneider <patrick.p2k.schneider@gmail.com>
%%
%% This file is part of ecoinpool.
%%
%% ecoinpool is free software: you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%%
%% ecoinpool is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License
%% along with ecoinpool.  If not, see <http://www.gnu.org/licenses/>.
%%

-record(configuration, {
    active_subpools :: [binary()],
    view_update_interval :: integer()
}).
-type configuration() :: #configuration{}.

-record(auxpool, {
    name :: binary(),
    pool_type :: atom(),
    round :: integer() | undefined,
    aux_daemon_config :: [conf_property()]
}).
-type auxpool() :: #auxpool{}.

-record(subpool, {
    id :: binary(),
    name :: binary(),
    port :: integer(),
    pool_type :: atom(),
    max_cache_size = 0 :: integer(),
    max_work_age :: integer(),
    round :: integer() | undefined,
    worker_share_subpools :: [binary()],
    coin_daemon_config :: [conf_property()],
    aux_pool :: auxpool() | undefined
}).
-type subpool() :: #subpool{}.

-record(worker, {
    id :: binary(),
    user_id :: term(),
    sub_pool_id :: binary(),
    name :: binary(),
    pass :: binary() | atom(),
    lp :: boolean(),
    lp_heartbeat :: boolean()
}).
-type worker() :: #worker{}.

-record(share, {
    subpool_id :: binary(),
    is_aux = false :: boolean(),
    pool_name :: binary(),
    worker_id :: binary(),
    worker_name :: binary(),
    user_id :: term(),
    peer :: peer(),
    timestamp :: erlang:timestamp(),
    state :: invalid | valid | candidate,
    reject_reason :: reject_reason() | undefined,
    hash :: binary() | undefined,
    parent_hash :: binary() | undefined,
    target :: binary() | undefined,
    block_num :: integer() | undefined,
    prev_block :: binary() | undefined,
    round :: integer() | undefined,
    data :: binary() | undefined,
    is_local = true :: boolean()
}).
-type share() :: #share{}.
