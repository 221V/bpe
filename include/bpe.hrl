-ifndef(BPE_HRL).
-define(BPE_HRL, true).

-include_lib("kvs/include/kvs.hrl").
-include_lib("kvs/include/kvs.hrl").

% BPMN 2.0 API

% TASKS

-record(task,         { name=[] :: [] | atom(),
                        module=[] :: [] | atom(),
                        prompt=[] :: list(tuple()),
                        roles=[] :: [] | binary(),
                        etc=[] :: list({term(),term()}) }).
-record(userTask,     { name=[] :: [] | atom(),
                        module=[] :: [] | atom(),
                        prompt=[] :: list(tuple()),
                        roles=[] :: [] | binary(),
                        etc=[] :: list({term(),term()})  }).
-record(serviceTask,  { name=[] :: [] | atom(),
                        module=[] :: [] | atom(),
                        prompt=[] :: list(tuple()),
                        roles=[] :: [] | binary(),
                        etc=[] :: list({term(),term()}) }).
-record(receiveTask,  { name=[] :: [] | atom(),
                        module=[] :: [] | atom(),
                        prompt=[] :: list(tuple()),
                        roles=[] :: [] | binary(),
                        etc=[] :: list({term(),term()}) }).

% EVENTS

-record(messageEvent, { name=[] :: [] | atom() | string() | binary(),
                        module=[] :: [] | atom(),
                        prompt=[] :: list(tuple()),
                        etc=[] :: list({term(),term()}),
                        payload=[] :: [] | binary(),
                        timeout=[] :: [] | {integer(),{integer(),integer(),integer() }}}).
-record(boundaryEvent,{ name=[] :: [] | atom(),
                        module=[] :: [] | atom(),
                        prompt=[] :: list(tuple()),
                        etc=[] :: list({term(),term()}),
                        payload=[] :: [] | binary(),
                        timeout=[] :: {integer(),{integer(),integer(),integer()}},
                        timeDate=[] :: [] | binary(),
                        timeDuration=[] :: [] | binary(),
                        timeCycle=[] :: [] | binary() }).
-record(timeoutEvent, { name=[] :: [] | atom(),
                        module=[] :: [] | atom(),
                        prompt=[] :: list(tuple()),
                        etc=[] :: list({term(),term()}),
                        payload=[] :: [] | binary(),
                        timeout=[] :: [] | {integer(),{integer(),integer(),integer()}},
                        timeDate=[] :: [] | binary(),
                        timeDuration=[] :: [] | binary(),
                        timeCycle=[] :: [] | binary() }).
-record(beginEvent ,  { name=[] :: [] | atom(),
                        module=[] :: [] | atom(),
                        prompt=[] :: list(tuple()),
                        etc=[] :: list({term(),term()}) }).
-record(endEvent,     { name=[] :: [] | atom(),
                        module=[] :: [] | atom(),
                        prompt=[] :: list(tuple()),
                        etc=[] :: list({term(),term()}) }).

% EDGES

-record(sequenceFlow, { source=[] :: [] | atom(),
                        target=[] :: [] | atom() | list(atom()) }).

% TRACE

-type histId() :: [] | integer() | {term(),term()}.

-record(hist,         { id = [] :: histId(),
                        container=feed :: [] | atom(),
                        feed_id=[] :: any(),
                        prev=[] :: [] | integer(),
                        next=[] :: [] | integer(),
                        feeds=[] :: list(),
                        name=[] :: [] | binary(),
                        task=[] :: [] | atom() | {atom()|string(),any()},
                        docs=[] :: list(tuple()),
                        time=[] :: term() }).

% PROCESS

-type tasks()  :: #task{} | #serviceTask{} | #userTask{} | #receiveTask{} | #beginEvent{} | #endEvent{}.
-type events() :: #messageEvent{} | #boundaryEvent{} | #timeoutEvent{}.
-type procId() :: [] | integer() | {atom(),any()}.

-record(process,      { id = [] :: procId(),
                        container=feed :: [] | atom(),
                        feed_id=[] :: [] | atom() | term(),
                        prev=[] :: [] | integer(),
                        next=[] :: [] | integer(),
                        name=[] :: [] | binary() | string() | atom(),
                        feeds=[] :: list(),
                        roles      = [] :: list(),
                        tasks      = [] :: list(tasks()),
                        events     = [] :: list(events()),
                        hist       = [] :: [] | term(),
                        flows      = [] :: list(#sequenceFlow{}),
                        rules      = [] :: [] | term(),
                        docs       = [] :: list(tuple()),
                        options    = [] :: term(),
                        task       = 'Created' :: [] | atom(),
                        timer      = [] :: [] | reference(),
                        notifications=[] :: [] | term(),
                        result     = [] :: [] | binary(),
                        started    = [] :: [] | calendar:datetime(),
                        beginEvent = [] :: [] | atom(),
                        endEvent   = [] :: [] | atom()}).

% BPE API

-record('Comp', { id=[]   :: [] | integer() }).
-record('Proc', { id=[]   :: [] | integer() }).
-record('Load', { id=[]   :: [] | integer() }).
-record('Hist', { id=[]   :: [] | integer() }).
-record('Make', { proc=[] :: [] | #process{} | binary(), docs=[] :: [] | list(tuple()) }).
-record('Amen', { id=[]   :: [] | integer(), docs=[] :: [] | list(tuple()) }).

-endif.
