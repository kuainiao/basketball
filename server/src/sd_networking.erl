%%%-----------------------------------
%%% @Module  : sd_networking
%%% @Author  : xyao
%%% @Email   : jiexiaowen@gmail.com
%%% @Created : 2010.06.1
%%% @Description: 网络
%%%-----------------------------------
-module(sd_networking).
-export([start/1]).

start([Ip, Port, Sid]) ->
    ok = start_kernel(),
    ok = start_disperse([Ip, Port, Sid]),
    ok = start_rand(),
    ok = start_client(),
    ok = start_tcp(Port),
    ok = start_task(),
    ok = start_timer().

%%开启核心服务
start_kernel() ->
    {ok,_} = supervisor:start_child(
               sd_sup,
               {mod_kernel,
                {mod_kernel, start_link,[]},
                permanent, 10000, supervisor, [mod_kernel]}),
    ok.

%%开启多线
start_disperse([Ip, Port, Sid]) ->
    {ok,_} = supervisor:start_child(
               sd_sup,
               {mod_disperse,
                {mod_disperse, start_link,[Ip, Port, Sid]},
                permanent, 10000, supervisor, [mod_disperse]}),
    ok.

%%随机种子
start_rand() ->
    {ok,_} = supervisor:start_child(
               sd_sup,
               {mod_rand,
                {mod_rand, start_link,[]},
                permanent, 10000, supervisor, [mod_rand]}),
    ok.


%%开启客户端监控树
start_client() ->
    {ok,_} = supervisor:start_child(
               sd_sup,
               {sd_tcp_client_sup,
                {sd_tcp_client_sup, start_link,[]},
                transient, infinity, supervisor, [sd_tcp_client_sup]}),
    ok.

%%开启tcp listener监控树
start_tcp(Port) ->
    {ok,_} = supervisor:start_child(
               sd_sup,
               {sd_tcp_listener_sup,
                {sd_tcp_listener_sup, start_link, [Port]},
                transient, infinity, supervisor, [sd_tcp_listener_sup]}),
    ok.

%%开启任务监控树
start_task() ->
    {ok,_} = supervisor:start_child(
               sd_sup,
               {mod_task,
                {mod_task, start_link,[]},
                permanent, 10000, supervisor, [mod_task]}),
    ok.

%%开启定时器监控树
start_timer() ->
    {ok,_} = supervisor:start_child(
               sd_sup,
               {timer_frame,
                {timer_frame, start_link,[]},
                permanent, 10000, supervisor, [timer_frame]}),
    ok.