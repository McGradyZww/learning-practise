using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LD.Client.Contract
{
   //逻辑_公共_融资融券基础数据_新增可冲抵保证金证券表
   public class FuncpubL_29_1Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_公共_融资融券基础数据_查询可冲抵保证金证券表
   public class FuncpubL_29_4Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 折算率
        /// </summary>
        public double discount_rate { get; set; }
 
        /// <summary>
        /// 冲抵状态
        /// </summary>
        public int offset_status { get; set; }
 
   }
 
   //逻辑_公共_融资融券基础数据_新增融资融券配置表
   public class FuncpubL_29_5Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_公共_融资融券基础数据_查询融资融券配置表
   public class FuncpubL_29_8Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 融资年利率
        /// </summary>
        public double fina_year_intrst_rate { get; set; }
 
        /// <summary>
        /// 融券年利率
        /// </summary>
        public double secu_loan_year_intrst_rate { get; set; }
 
        /// <summary>
        /// 融资罚息利率
        /// </summary>
        public double fina_pen_intrst_rate { get; set; }
 
        /// <summary>
        /// 融券罚息利率
        /// </summary>
        public double secu_loan_pen_intrst_rate { get; set; }
 
        /// <summary>
        /// 结息日期
        /// </summary>
        public int intrst_sett_day { get; set; }
 
   }
 
   //逻辑_公共_融资融券基础数据_新增融资融券标的证券表
   public class FuncpubL_29_9Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_公共_融资融券基础数据_查询融资融券标的证券表
   public class FuncpubL_29_12Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 融资状态
        /// </summary>
        public String fina_status { get; set; }
 
        /// <summary>
        /// 融券状态
        /// </summary>
        public String secu_loan_status { get; set; }
 
   }
 
   //逻辑_公共_融资融券基础数据_新增融资融券券商禁止标的证券表
   public class FuncpubL_29_13Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_公共_融资融券基础数据_查询融资融券券商禁止标的证券表
   public class FuncpubL_29_16Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 融资状态
        /// </summary>
        public String fina_status { get; set; }
 
        /// <summary>
        /// 融券状态
        /// </summary>
        public String secu_loan_status { get; set; }
 
   }
 
   //逻辑_公共_融资融券基础数据_新增融资融券保证金比例配置表
   public class FuncpubL_29_17Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
   }
 
   //逻辑_公共_融资融券基础数据_查询融资融券保证金比例配置表
   public class FuncpubL_29_20Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 融资保证金比例
        /// </summary>
        public double fina_marg_ratio { get; set; }
 
        /// <summary>
        /// 融券保证金比例
        /// </summary>
        public double secu_loan_marg_ratio { get; set; }
 
        /// <summary>
        /// 融券价格限制
        /// </summary>
        public double secu_loan_price_limit { get; set; }
 
   }
 
   //逻辑_公共_融资融券基础数据_获取融资融券保证金比例配置
   public class FuncpubL_29_21Model : BaseModel
   {
        /// <summary>
        /// 融资保证金比例
        /// </summary>
        public double fina_marg_ratio { get; set; }
 
        /// <summary>
        /// 融券保证金比例
        /// </summary>
        public double secu_loan_marg_ratio { get; set; }
 
        /// <summary>
        /// 融券价格限制
        /// </summary>
        public double secu_loan_price_limit { get; set; }
 
   }
 
   //逻辑_公共_融资融券基础数据_获取可冲抵保证金证券表
   public class FuncpubL_29_22Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 折算率
        /// </summary>
        public double discount_rate { get; set; }
 
        /// <summary>
        /// 冲抵状态
        /// </summary>
        public int offset_status { get; set; }
 
   }
 
   //逻辑_公共_融资融券基础数据_查询机构融资融券保证金比例
   public class FuncpubL_29_23Model : BaseModel
   {
        /// <summary>
        /// 记录序号
        /// </summary>
        public ulong row_id { get; set; }
 
        /// <summary>
        /// 通道编号
        /// </summary>
        public int pass_no { get; set; }
 
        /// <summary>
        /// 机构编号
        /// </summary>
        public int co_no { get; set; }
 
        /// <summary>
        /// 证券代码编号
        /// </summary>
        public int stock_code_no { get; set; }
 
        /// <summary>
        /// 证券代码
        /// </summary>
        public String stock_code { get; set; }
 
        /// <summary>
        /// 市场编号
        /// </summary>
        public int exch_no { get; set; }
 
        /// <summary>
        /// 证券类型
        /// </summary>
        public int stock_type { get; set; }
 
        /// <summary>
        /// 融资保证金比例
        /// </summary>
        public double fina_marg_ratio { get; set; }
 
        /// <summary>
        /// 融券保证金比例
        /// </summary>
        public double secu_loan_marg_ratio { get; set; }
 
        /// <summary>
        /// 融券价格限制
        /// </summary>
        public double secu_loan_price_limit { get; set; }
 
   }
 
}
