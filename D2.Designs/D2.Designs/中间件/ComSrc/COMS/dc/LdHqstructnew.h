#pragma once
#pragma	pack(1)
#pragma warning(disable : 4996)


/*
市场类别定义：
各位含义表示如下：
15		   12		8					0
|			|	  	  |					|
| 金融分类	|市场分类 |	交易品种分类	|
*/
typedef unsigned short LDMarketDataType;			  // 市场分类数据类型

struct CodeInfo
{
	LDMarketDataType	m_cCodeType;	// 证券类型
	char				m_cCode[6];		// 证券代码
};


// Level2 6档后行情
struct DeepLevelRealTime
{
	uint32				m_lBuyPrice6;			// 买六价
	uint32		m_lBuyCount6;			// 买六量
	uint32				m_lBuyPrice7;			// 买七价
	uint32		m_lBuyCount7;			// 买七量
	uint32				m_lBuyPrice8;			// 买八价
	uint32		m_lBuyCount8;			// 买八量
	uint32				m_lBuyPrice9;			// 买九价
	uint32		m_lBuyCount9;			// 买九量
	uint32				m_lBuyPrice10;			// 买十价
	uint32		m_lBuyCount10;			// 买十量

	uint32				m_lSellPrice6;			// 卖六价
	uint32		m_lSellCount6;			// 卖六量
	uint32				m_lSellPrice7;			// 卖七价
	uint32		m_lSellCount7;			// 卖七量
	uint32				m_lSellPrice8;			// 卖八价
	uint32		m_lSellCount8;			// 卖八量
	uint32				m_lSellPrice9;			// 卖九价
	uint32		m_lSellCount9;			// 卖九量
	uint32				m_lSellPrice10;			// 卖十价
	uint32		m_lSellCount10;			// 卖十量
};

// Level 2 行情数据
struct LevelRealTime
{
	uint32   m_lOpen;			//开
	uint32   m_lMaxPrice;		//高
	uint32	m_lMinPrice;		//低
	uint32	m_lNewPrice;		//新
	uint32	m_lTotal;			//成交量
	//long	m_fAvgPrice;		//6  成交额(单位:百元)
	float	m_fAvgPrice;		//	类型改为float防止越界

	uint32				m_lBuyPrice1;			// 买一价
	uint32		m_lBuyCount1;			// 买一量
	uint32				m_lBuyPrice2;			// 买二价
	uint32		m_lBuyCount2;			// 买二量
	uint32				m_lBuyPrice3;			// 买三价
	uint32		m_lBuyCount3;			// 买三量
	uint32				m_lBuyPrice4;			// 买四价
	uint32		m_lBuyCount4;			// 买四量
	uint32				m_lBuyPrice5;			// 买五价
	uint32		m_lBuyCount5;			// 买五量

	uint32				m_lSellPrice1;			// 卖一价
	uint32		m_lSellCount1;			// 卖一量
	uint32				m_lSellPrice2;			// 卖二价
	uint32		m_lSellCount2;			// 卖二量
	uint32				m_lSellPrice3;			// 卖三价
	uint32		m_lSellCount3;			// 卖三量
	uint32				m_lSellPrice4;			// 卖四价
	uint32		m_lSellCount4;			// 卖四量
	uint32				m_lSellPrice5;			// 卖五价
	uint32		m_lSellCount5;			// 卖五量

	DeepLevelRealTime   m_DeepLevel;			// 深六档

	uint32       m_lTickCount;			// 成交笔数	

	float				m_fBuyTotal;			// 委托买入总量
	float				WeightedAvgBidPx;		// 加权平均委买价格
	float				AltWeightedAvgBidPx;

	float				m_fSellTotal;			// 委托卖出总量
	float				WeightedAvgOfferPx;		// 加权平均委卖价格
	float				AltWeightedAvgOfferPx;

	float				m_IPOV;					// ETF IPOV	

	uint32		m_Time;					// 时间戳
};

struct CStockLevelRealTimeData
{
	CodeInfo			m_stockCode;
	uint32				m_lPrevClose;		//昨收
	uint32		m_l5DayVol;			//五日量
	uint32				m_nPriceUnit;		//价格单位
	uint32				m_nDecimal;			//价格精度
	uint32				m_nHandNum;         //每手股数
	uint32				m_lUpPrice;			// 涨停板价
	uint32				m_lDownPrice;		// 跌停板价
	uint32				m_lStopFlag;		// 停盘标志。0：正常，1：停盘
	uint32				m_lExt1;			// 目前只在ETF时有用，为其IOPV值（例如510050时为510051的最新价,基金时为基金净值）
	LevelRealTime		m_stockLevelRealTime;
	uint64_t			m_ltime_stamp1;			//47 自定时间戳(行情服务器接收时间)
	uint64_t			m_ltime_stamp2;			//48 自定时间戳(行情服务器发送时间)
};

#pragma	pack()
