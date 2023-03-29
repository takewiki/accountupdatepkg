#' 更新采购订单付款计划科目编码
#'
#' @param token 访问口令
#'
#' @return 无返回值
#' @export
#'
#' @examples
rds_accountcode_po <- function(token = "5148FAAF-E45C-43D3-9F96-9F943F4F341B") {

  sql = "	update A  SET A.F_NLJ_ACCOUNTCODE = D.FNUMBER
        	FROM
        	t_PUR_POOrderEntry A
        	INNER JOIN
        	T_BD_ACCOUNT_L C
        	ON C.FACCTID = A.F_NLJ_ACCOUNTCODE
        	inner join
        	T_BD_ACCOUNT D
        	on C.FACCTID = D.FACCTID
        	inner join
        	T_PUR_POORDERINSTALLMENT B
        	on A.FID =B.FID
        	AND A.FSEQ = B.FSEQ
        	INNER JOIN
        	t_PUR_POOrder  E
        	ON E.FID =B.FID
        	 inner join   t_BD_Supplier  F
        	on E.FSUPPLIERID = F.FSUPPLIERID
        	WHERE  F.F_NLJ_CHECKBOX = 1
        	AND  A.F_NLJ_ACCOUNTCODE <> ' '
       "
  res = tsda::sql_update2(token = token,sql_str = sql)
  return(res)
}