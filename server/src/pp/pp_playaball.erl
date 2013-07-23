%%%--------------------------------------
%%% @Module  : pp_playaball
%%% @Author  : lsm
%%% @Email   : lsm19870508@gmail.com
%%% @Created : 2013.06.21
%%% @Description:玩个球逻辑
%%%--------------------------------------
-module(pp_playaball).
-export([handle/3]).
-include("common.hrl").
-include("record.hrl").

%%投个篮初始化
handle(40000,Socket,_Data) ->
	MaxBoardNum = 40*2,
	MaxTime = 240,%%限定的最长游戏时间
    L = generate_board_list(0,MaxBoardNum,[]),
	{ok,BinData} = pt_40:write(40000,[MaxTime,L]),
	?DEBUG("40000 BinData is:~p~n",[[BinData]]),
	lib_send:send_one(Socket,BinData);

%%投个篮结果
handle(40001,Socket,Data) ->
	RetCode = check_result(Data),
	{ok,BinData} = pt_40:write(40001,RetCode),
	?DEBUG("40001 BinData is:~p~n",[[BinData]]),
	lib_send:send_one(Socket,BinData).

generate_board_list(Max,Max,L) ->
	L;

generate_board_list(Index,Max,L) ->
	TrainPoint = 7,
	MaxTimePoint = 4,
	MaxLiBao = 3,
	Rand = util:rand(1,TrainPoint+MaxTimePoint+MaxLiBao),
	if 
		Rand =< TrainPoint ->
			Rand1 = Rand;
		Rand =< TrainPoint + MaxTimePoint ->
			Rand1 = 20 + Rand - TrainPoint - 1;
		Rand =< TrainPoint + MaxTimePoint+MaxLiBao ->
			Rand1 = 40 + Rand - TrainPoint - MaxTimePoint - 1;
		true ->
			Rand1 = 0
	end,
	generate_board_list(Index+1,Max,L ++ [Rand1]).

check_result(Data) ->
	0.