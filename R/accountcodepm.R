#' 付款单科目编码更新
#'
#' @param token 访问口令
#'
#' @return  无返回值
#' @export
#'
#' @examples
rds_accountcode_pm <- function(token = "5148FAAF-E45C-43D3-9F96-9F943F4F341B") {

  sql = "UPDATE A SET A.F_NLJ_ACCOUNTCODE1 = B.F_NLJ_ACCOUNTCODE
        	FROM
        	T_AP_PAYBILLENTRY  A
        	inner join
        	T_AP_PAYBILLSRCENTRY B
        	on A.FID =B.FID
        	AND A.FSEQ = B.FSEQ
        	INNER JOIN
        	t_PUR_POOrder  E
        	ON E.FBILLNO = A.FPURCHASEORDERNO
        	inner join
        	t_BD_Supplier  F
        	on E.FSUPPLIERID = F.FSUPPLIERID
        	WHERE  F.F_NLJ_CHECKBOX = 1
        	AND  B.F_NLJ_ACCOUNTCODE <> ' '
          "
  res = tsda::sql_update2(token = token,sql_str = sql)
  return(res)
}