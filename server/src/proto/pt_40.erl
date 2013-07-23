%%%-----------------------------------
%%% @Module  : pt_40
%%% @Author  : lsm
%%% @Email   : lsm19870508@gmail.com
%%% @Created : 2013.06.20
%%% @Description: 40投个篮
%%%-----------------------------------
-module(pt_40).
-export([read/2, write/2]).

%%
%%客户端 -> 服务端 ----------------------------
%%

%%登陆
read(40000, _) ->
    {ok, playaball};

%%退出
read(40001, <<Time:8,Bin/binary>>) ->	
    {ok, playballresult,[Time,Bin]}.

%%
%%服务端 -> 客户端 ------------------------------------
%%

write(40000,[Time,L])->
	N = length(L),
	LB = list_to_binary(L),
	Data = <<Time:8,N:8,LB/binary>>,
	{ok,pt:pack(40000,Data)};

write(40001,RetCode)->
	Data = <<RetCode:8>>,
	{ok,pt:pack(40001,Data)}.
