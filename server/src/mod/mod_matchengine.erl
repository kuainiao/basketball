%%%--------------------------------------
%%% @Module  : pp_matchengine
%%% @Author  : lsm
%%% @Email   : lsm19870508@gmail.com
%%% @Created : 2013.07.22
%%% @Description:比赛引擎主逻辑
%%%--------------------------------------


-module(mod_matchengine).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start_match/0]).



%% ====================================================================
%% Internal functions
%% ====================================================================
-define(MATCH_TIME_PERQUART, 720).%%每一节比赛长度，秒
-define(MAX_QUARTER, 4).%%比赛节数
-define(MIN_NORMAL_ATTACK, 15).%%比赛时间
-define(MAX_NORMAL_ATTACK, 24).%%比赛时间
-define(MIN_FAST_ATTACK, 8).%%快攻比赛时间
-define(MAX_FAST_ATTACK, 12).%%快攻比赛时间
start_match()->
	%%先模拟两个队伍
	Team1 = [1,2,3,4,5],
	Team2 = [6,7,8,9,10],
	TeamId1 = 1000,
	TeamId2 = 1001,
	
	iRand = util:rand(0,1),
			case iRand of
				0 ->
					attackTeamId = Id1,
				1 ->
					attackTeamId = Id2
			end,
	gen_match_quarter(1,Team1,Team2,TeamId1,TeamId2,attackTeamId,[]).

gen_match_quarter(4,Team1,Team2,Id1,Id2,FirstAttacker,Result)->
	attackId = FirstAttacker,
	gen_match_round(0,attackId);

%%以节为单位生成比赛
gen_match_quarter(Idx,Team1,Team2,Id1,Id2,FirstAttacker,Result)->
	%%确定这一回合的首攻者
	case Idx of
		1 ->
			attackId = FirstAttacker,
		4 ->
			attackId = FirstAttacker,
		_ ->
			case (Id1 == FirstAttacker) of
				true->
					attackId = Id2,
				false->
					attackId = Id1
			end
	end,

	gen_match_round(0,attackId,0),
	gen_match_quarter(Idx+1,Team1,Team2,Id1,Id2,FirstAttacker,Result).

gen_match_round(Time,attackId,bFastAttack)->
	%%获取回合时间
	RoundTime = getRoundTime(bFastAttack),
	%%
	

	
getRoundTime(bFast)->
	case bFast of
		true ->
			util:rand(?MIN_FAST_ATTACK,?MAX_FAST_ATTACK),
		false ->
			util:rand(?MIN_NORMAL_ATTACK,?MAX_NORMAL_ATTACK)
	end.

		   
