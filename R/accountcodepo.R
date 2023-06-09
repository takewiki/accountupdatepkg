#' 更新采购订单付款计划科目编码
#'
#' @param token 访问口令
#'
#' @return 无返回值
#' @export
#'
#' rds_accountcode_po(token = "C0426D23-1927-4314-8736-A74B2EF7A039")

rds_accountcode_po <- function(token = "C0426D23-1927-4314-8736-A74B2EF7A039") {

  sql = "			 update A  SET A.F_NLJ_ACCOUNTCODE1 = D.FNUMBER
            	FROM
            	T_PUR_POORDERINSTALLMENT A
            	INNER JOIN
            	t_PUR_POOrderEntry  B
            	on A.FID =B.FID
            	AND A.FSEQ = B.FSEQ
            	inner join
            	T_BD_ACCOUNT_L C
            	ON C.FACCTID = B.F_NLJ_ACCOUNTCODE
            	inner join
            	T_BD_ACCOUNT D
            	on C.FACCTID = D.FACCTID
            	INNER JOIN
            	t_PUR_POOrder  E
            	ON E.FID =B.FID
            	 inner join   t_BD_Supplier  F
            	on E.FSUPPLIERID = F.FSUPPLIERID
            	WHERE  F.F_NLJ_CHECKBOX = 1
            	AND  B.F_NLJ_ACCOUNTCODE <> ' '
       "
  res = tsda::sql_update2(token = token,sql_str = sql)
  return(res)
}
