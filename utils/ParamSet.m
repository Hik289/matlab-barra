% -------------------------------------------------------------------------
% 全局参数设置
% -------------------------------------------------------------------------
function param = ParamSet()

% -------------------------------------------------------------------------
% 全局参数
% -------------------------------------------------------------------------
% 每次更新数据后，回溯运行多少天，设置为-1就表示初始化模式
param.global.backLength = -1;    

% 市值加权权重是否取平方根：1-取；0-不取
param.global.capSqrtFlag = 1;           

% 修正大市值股票的修正分位数
param.global.mktBlockRatio = 95;     

% 缺失值填充行业均值时，有效数据量下限
param.global.thDataTooFew = 0;    

% Z-score去极值中的阈值(中位数的倍数)
param.global.thZscore = 3;         

% 中间结果保存路径
param.global.save_path = 'result/';     

% 风格因子、行业因子、国家因子个数（不能修改的参数）
param.global.styleFactorNum = 10;       
param.global.indusFactorNum = 30;       
param.global.countryFactorNum = 1;       

% -------------------------------------------------------------------------
% 因子暴露计算相关参数
% -------------------------------------------------------------------------
% 规模因子（Size）
param.Size.mrkCapType = 'total';             % 'total'-总市值；'float'-流通市值
param.Size.LNCAP.weight = 1.0;               % 细类因子合成权重 

% Beta因子（Beta）
param.Beta.timeWindow = 252;                 % 时窗长度 
param.Beta.halfLife = 63;                    % 半衰期长度 
param.Beta.indexName = 'ZZQZ';               % 回归基准
param.Beta.BETA.weight = 1.0;                % 细类因子合成权重 

% 动量因子（Momentum）
param.Mmnt.timeWindow = 504;                 % 时窗长度 
param.Mmnt.halfLife = 126;                   % 半衰期长度 
param.Mmnt.lag = 21;                         % 剔除近1一个月样本 
param.Mmnt.RSTR.weight = 1.0;                % 细类因子合成权重

% 波动率（Residual Volatility）
param.ResidVola.nanOpt = 'omitnan';          % DASTD与HSIGMA计算中是否忽略nan：'omitnan'-忽略nan；'includenan'-不忽略nan 
param.ResidVola.negaOpt = -0.99;             % CMRA计算中，累积T月对数收益Z(T)<=-1时的负值调整 
param.ResidVola.indexName = '中证全指';      % 回归基准
param.ResidVola.DASTD.timeWindow = 252;      % DASTD  时窗长度 
param.ResidVola.DASTD.halfLife = 42;         % DASTD  权重指数衰减的半衰期长度 
param.ResidVola.CMRA.timeWindow = 12;        % CMRA   时窗长度
param.ResidVola.CMRA.dayNumOfMonth = 21;     % CMRA   求和时间区段长度 
param.ResidVola.HSIGMA.timeWindow = 252;     % HSIGMA 时窗长度
param.ResidVola.HSIGMA.halfLife = 63;        % HSIGMA 权重指数衰减的半衰期长度 
param.ResidVola.HSIGMA.regressWindow = 252;  % HSIGMA 回归参数-时窗 
param.ResidVola.HSIGMA.regressHalfLife = 63; % HSIGMA 回归参数-半衰期 
param.ResidVola.DASTD.weight = 0.74;         % DASTD  权重
param.ResidVola.CMRA.weight = 0.16;          % CMRA   权重 
param.ResidVola.HSIGMA.weight = 0.10;        % HSIGMA 权重 

% 非线性规模因子(Non-linear Size)
param.NonLinear.NLSIZE.weight = 1;           % NLSIZE权重 

% Book to Price
param.BktoPrc.rptFreq = 'annual';            % 使用财报类型：'annual'-只使用最新年报数据；'quarterly'-使用最新的季频数据 
param.BktoPrc.mrkCapType = 'total';          % 市值类型：'total'-总市值；'float'-流通市值 
param.BktoPrc.BTOP.weight = 1.0;             % BTOP 权重

% 流动性(Liquidity)
param.Liquidity.nanOpt = 'omitnan';          % 换手率计算中是否忽略nan：'omitnan'-忽略nan；'includenan'-不忽略nan  
param.Liquidity.dayNumOfMonth = 21;          % 换手率计算区间(月)长度 
param.Liquidity.STOQ.T=3;                    % STOQ 换手率计算的时间长度(月) 
param.Liquidity.STOA.T=12;                   % STOA 换手率计算的时间长度(月)
param.Liquidity.STOM.weight = 0.35;          % 因子合成中 STOM 的权重 
param.Liquidity.STOQ.weight = 0.35;          % 因子合成中 STOQ 的权重 
param.Liquidity.STOA.weight = 0.30;          % 因子合成中 STOA 的权重 

% Earning Yield因子
param.EarningYield.mrkCapType = 'total';     % CETOP与ETOP中的市值类型：'total'-总市值；'float'-流通市值 
param.EarningYield.rptFreq = 'quarterly';    % 使用财报类型：'annual'-只使用最新年报数据；'quarterly'-使用最新的季频数据  
param.EarningYield.EPFWD.weight = 0.68;      % 因子合成中 EPFWD 的权重(一致预期因子,实际舍去) 
param.EarningYield.CETOP.weight = 0.21;      % 因子合成中 CETOP 的权重(实际为0.21/(0.21+0.11)=0.66)  
param.EarningYield.ETOP.weight = 0.11;       % 因子合成中 ETOP 的权重 (实际为0.11/(0.21+0.11)=0.34) 

% 成长性因子(Growth)
param.Growth.negaOpt = 'abs';                % EGRO计算中分母为负时的调整：'abs'-分母取绝对值；'nan'-分母置nan 
param.Growth.yearWindow = 5;                 % 考察多少年的复合增长率
param.Growth.EGRLF.weight = 0.18;            % 因子合成中 EGRLF 的权重(一致预期因子,舍去) 
param.Growth.EGRSF.weight = 0.11;            % 因子合成中 EGRSF 的权重(一致预期因子,舍去) 
param.Growth.EGRO.weight = 0.24;             % 因子合成中 EGRO 的权重 (实际为0.24/(0.24+0.47)=0.34) 
param.Growth.SGRO.weight = 0.47;             % 因子合成中 SGRO 的权重 (实际为0.47/(0.24+0.47)=0.66) 

% 杠杆因子（Leverage）
param.Leverage.rptFreq = 'annual';           % 使用财报类型：'annual'-只使用最新年报数据；'quarterly'-使用最新的季频数据 
param.Leverage.MLEV.weight = 0.38;           % 因子合成中 MLEV 的权重 
param.Leverage.DTOA.weight = 0.35;           % 因子合成中 DTOA 的权重 
param.Leverage.BLEV.weight = 0.27;           % 因子合成中 BLEV 的权重 

% -------------------------------------------------------------------------
% 协方差矩阵估计相关参数
% -------------------------------------------------------------------------
% 因子协方差矩阵 Newey-West调整 
param.FactorCov.NW.tBegin = 1000;           % 因子协方差矩阵的NW调整 计算的开始日期 
param.FactorCov.NW.timeWindow = 252;        % NW调整的时窗长度 
param.FactorCov.NW.timeWindowS = 42;        % NW调整的时窗长度（短时窗） 
param.FactorCov.NW.halfLife = 90;           % NW调整中，指数加权的半衰期 
param.FactorCov.NW.dayNumOfMonth = 21;      % NW调整中，调整为月频数据使用的倍率,代表每月天数
param.FactorCov.NW.D = 2;                   % NW调整中，错位互相关的错位最大日期 

% 因子协方差矩阵 特征值调整
param.FactorCov.EigenAdj.MCS = 3000;        % 蒙特卡洛模拟次数 
param.FactorCov.EigenAdj.timeWindow = 100;  % 特征值调整选取的时间窗长度 
param.FactorCov.EigenAdj.A = 1.5;           % 由于尖峰厚尾特征，需要对模拟风险偏差进行调整 

% 因子协方差矩阵 波动率调整
param.FactorCov.VolRegAdj.timeWin = 252;    % 波动率偏误调整的时间窗长度 
param.FactorCov.VolRegAdj.halfLife = 42;    % 波动率偏误调整的指数加权的半衰期 

% 特异性协方差矩阵 Newey-West调整
param.SpecialCov.NW.tBegin = 1000;          % 特异性协方差矩阵的NW调整 计算的开始日期
param.SpecialCov.NW.timeWindow = 252;       % NW调整的时窗长度 
param.SpecialCov.NW.halfLife = 90;          % NW调整中，指数加权的半衰期 
param.SpecialCov.NW.dayNumOfMonth = 21;     % NW调整中，调整为月频数据使用的倍率 
param.SpecialCov.NW.D = 5;                  % NW调整中，错位互相关的错位最大日期

% 特异性协方差矩阵  结构化调整
param.SpecialCov.StructAdj.timeWindow = 252;     % 结构化调整中，时间窗长度 
param.SpecialCov.StructAdj.E0 = 1.05;            % 参数E0，用于抵消残差的影响 
param.SpecialCov.StructAdj.regressMode = 'WLS';  % 'WLS'-流通市值加权回归；'OLS'-等权回归 
param.SpecialCov.StructAdj.factorNum = 41;       % 可设置为只选风格因子 
                              
% 特异性协方差矩阵 贝叶斯压缩
param.SpecialCov.BiasAdj.q = 1;                  % 贝叶斯压缩中，系数q 
param.SpecialCov.BiasAdj.groupNum = 10;          % 贝叶斯压缩中，市值分组的数目
param.SpecialCov.BiasAdj.blockRatio = 95;        % 市值加权时，大市值调整的分位数

% 特异性协方差矩阵 波动率调整
param.SpecialCov.VolRegAdj.timeWindow = 252;     % 波动率调整 时间窗
param.SpecialCov.VolRegAdj.halfLife = 42;        % 波动率调整 半衰期


end