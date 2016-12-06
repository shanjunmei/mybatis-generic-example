package com.ffzx.demo.model;

import com.ffzx.orm.common.GenericExample.GeneratedCriteria;
import com.ffzx.orm.common.GenericExample;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SettleBillExample extends GenericExample<SettleBillExample.Criteria> {

    public SettleBillExample() {
        oredCriteria = new ArrayList<SettleBillExample.Criteria>();
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(String value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(String value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(String value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(String value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(String value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(String value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLike(String value) {
            addCriterion("id like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotLike(String value) {
            addCriterion("id not like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<String> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<String> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(String value1, String value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(String value1, String value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andCodeIsNull() {
            addCriterion("code is null");
            return (Criteria) this;
        }

        public Criteria andCodeIsNotNull() {
            addCriterion("code is not null");
            return (Criteria) this;
        }

        public Criteria andCodeEqualTo(String value) {
            addCriterion("code =", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeNotEqualTo(String value) {
            addCriterion("code <>", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeGreaterThan(String value) {
            addCriterion("code >", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeGreaterThanOrEqualTo(String value) {
            addCriterion("code >=", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeLessThan(String value) {
            addCriterion("code <", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeLessThanOrEqualTo(String value) {
            addCriterion("code <=", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeLike(String value) {
            addCriterion("code like", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeNotLike(String value) {
            addCriterion("code not like", value, "code");
            return (Criteria) this;
        }

        public Criteria andCodeIn(List<String> values) {
            addCriterion("code in", values, "code");
            return (Criteria) this;
        }

        public Criteria andCodeNotIn(List<String> values) {
            addCriterion("code not in", values, "code");
            return (Criteria) this;
        }

        public Criteria andCodeBetween(String value1, String value2) {
            addCriterion("code between", value1, value2, "code");
            return (Criteria) this;
        }

        public Criteria andCodeNotBetween(String value1, String value2) {
            addCriterion("code not between", value1, value2, "code");
            return (Criteria) this;
        }

        public Criteria andPayStatusIsNull() {
            addCriterion("pay_status is null");
            return (Criteria) this;
        }

        public Criteria andPayStatusIsNotNull() {
            addCriterion("pay_status is not null");
            return (Criteria) this;
        }

        public Criteria andPayStatusEqualTo(String value) {
            addCriterion("pay_status =", value, "payStatus");
            return (Criteria) this;
        }

        public Criteria andPayStatusNotEqualTo(String value) {
            addCriterion("pay_status <>", value, "payStatus");
            return (Criteria) this;
        }

        public Criteria andPayStatusGreaterThan(String value) {
            addCriterion("pay_status >", value, "payStatus");
            return (Criteria) this;
        }

        public Criteria andPayStatusGreaterThanOrEqualTo(String value) {
            addCriterion("pay_status >=", value, "payStatus");
            return (Criteria) this;
        }

        public Criteria andPayStatusLessThan(String value) {
            addCriterion("pay_status <", value, "payStatus");
            return (Criteria) this;
        }

        public Criteria andPayStatusLessThanOrEqualTo(String value) {
            addCriterion("pay_status <=", value, "payStatus");
            return (Criteria) this;
        }

        public Criteria andPayStatusLike(String value) {
            addCriterion("pay_status like", value, "payStatus");
            return (Criteria) this;
        }

        public Criteria andPayStatusNotLike(String value) {
            addCriterion("pay_status not like", value, "payStatus");
            return (Criteria) this;
        }

        public Criteria andPayStatusIn(List<String> values) {
            addCriterion("pay_status in", values, "payStatus");
            return (Criteria) this;
        }

        public Criteria andPayStatusNotIn(List<String> values) {
            addCriterion("pay_status not in", values, "payStatus");
            return (Criteria) this;
        }

        public Criteria andPayStatusBetween(String value1, String value2) {
            addCriterion("pay_status between", value1, value2, "payStatus");
            return (Criteria) this;
        }

        public Criteria andPayStatusNotBetween(String value1, String value2) {
            addCriterion("pay_status not between", value1, value2, "payStatus");
            return (Criteria) this;
        }

        public Criteria andVendorCodeIsNull() {
            addCriterion("vendor_code is null");
            return (Criteria) this;
        }

        public Criteria andVendorCodeIsNotNull() {
            addCriterion("vendor_code is not null");
            return (Criteria) this;
        }

        public Criteria andVendorCodeEqualTo(String value) {
            addCriterion("vendor_code =", value, "vendorCode");
            return (Criteria) this;
        }

        public Criteria andVendorCodeNotEqualTo(String value) {
            addCriterion("vendor_code <>", value, "vendorCode");
            return (Criteria) this;
        }

        public Criteria andVendorCodeGreaterThan(String value) {
            addCriterion("vendor_code >", value, "vendorCode");
            return (Criteria) this;
        }

        public Criteria andVendorCodeGreaterThanOrEqualTo(String value) {
            addCriterion("vendor_code >=", value, "vendorCode");
            return (Criteria) this;
        }

        public Criteria andVendorCodeLessThan(String value) {
            addCriterion("vendor_code <", value, "vendorCode");
            return (Criteria) this;
        }

        public Criteria andVendorCodeLessThanOrEqualTo(String value) {
            addCriterion("vendor_code <=", value, "vendorCode");
            return (Criteria) this;
        }

        public Criteria andVendorCodeLike(String value) {
            addCriterion("vendor_code like", value, "vendorCode");
            return (Criteria) this;
        }

        public Criteria andVendorCodeNotLike(String value) {
            addCriterion("vendor_code not like", value, "vendorCode");
            return (Criteria) this;
        }

        public Criteria andVendorCodeIn(List<String> values) {
            addCriterion("vendor_code in", values, "vendorCode");
            return (Criteria) this;
        }

        public Criteria andVendorCodeNotIn(List<String> values) {
            addCriterion("vendor_code not in", values, "vendorCode");
            return (Criteria) this;
        }

        public Criteria andVendorCodeBetween(String value1, String value2) {
            addCriterion("vendor_code between", value1, value2, "vendorCode");
            return (Criteria) this;
        }

        public Criteria andVendorCodeNotBetween(String value1, String value2) {
            addCriterion("vendor_code not between", value1, value2, "vendorCode");
            return (Criteria) this;
        }

        public Criteria andVendorNameIsNull() {
            addCriterion("vendor_name is null");
            return (Criteria) this;
        }

        public Criteria andVendorNameIsNotNull() {
            addCriterion("vendor_name is not null");
            return (Criteria) this;
        }

        public Criteria andVendorNameEqualTo(String value) {
            addCriterion("vendor_name =", value, "vendorName");
            return (Criteria) this;
        }

        public Criteria andVendorNameNotEqualTo(String value) {
            addCriterion("vendor_name <>", value, "vendorName");
            return (Criteria) this;
        }

        public Criteria andVendorNameGreaterThan(String value) {
            addCriterion("vendor_name >", value, "vendorName");
            return (Criteria) this;
        }

        public Criteria andVendorNameGreaterThanOrEqualTo(String value) {
            addCriterion("vendor_name >=", value, "vendorName");
            return (Criteria) this;
        }

        public Criteria andVendorNameLessThan(String value) {
            addCriterion("vendor_name <", value, "vendorName");
            return (Criteria) this;
        }

        public Criteria andVendorNameLessThanOrEqualTo(String value) {
            addCriterion("vendor_name <=", value, "vendorName");
            return (Criteria) this;
        }

        public Criteria andVendorNameLike(String value) {
            addCriterion("vendor_name like", value, "vendorName");
            return (Criteria) this;
        }

        public Criteria andVendorNameNotLike(String value) {
            addCriterion("vendor_name not like", value, "vendorName");
            return (Criteria) this;
        }

        public Criteria andVendorNameIn(List<String> values) {
            addCriterion("vendor_name in", values, "vendorName");
            return (Criteria) this;
        }

        public Criteria andVendorNameNotIn(List<String> values) {
            addCriterion("vendor_name not in", values, "vendorName");
            return (Criteria) this;
        }

        public Criteria andVendorNameBetween(String value1, String value2) {
            addCriterion("vendor_name between", value1, value2, "vendorName");
            return (Criteria) this;
        }

        public Criteria andVendorNameNotBetween(String value1, String value2) {
            addCriterion("vendor_name not between", value1, value2, "vendorName");
            return (Criteria) this;
        }

        public Criteria andPayAmountSumIsNull() {
            addCriterion("pay_amount_sum is null");
            return (Criteria) this;
        }

        public Criteria andPayAmountSumIsNotNull() {
            addCriterion("pay_amount_sum is not null");
            return (Criteria) this;
        }

        public Criteria andPayAmountSumEqualTo(BigDecimal value) {
            addCriterion("pay_amount_sum =", value, "payAmountSum");
            return (Criteria) this;
        }

        public Criteria andPayAmountSumNotEqualTo(BigDecimal value) {
            addCriterion("pay_amount_sum <>", value, "payAmountSum");
            return (Criteria) this;
        }

        public Criteria andPayAmountSumGreaterThan(BigDecimal value) {
            addCriterion("pay_amount_sum >", value, "payAmountSum");
            return (Criteria) this;
        }

        public Criteria andPayAmountSumGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("pay_amount_sum >=", value, "payAmountSum");
            return (Criteria) this;
        }

        public Criteria andPayAmountSumLessThan(BigDecimal value) {
            addCriterion("pay_amount_sum <", value, "payAmountSum");
            return (Criteria) this;
        }

        public Criteria andPayAmountSumLessThanOrEqualTo(BigDecimal value) {
            addCriterion("pay_amount_sum <=", value, "payAmountSum");
            return (Criteria) this;
        }

        public Criteria andPayAmountSumIn(List<BigDecimal> values) {
            addCriterion("pay_amount_sum in", values, "payAmountSum");
            return (Criteria) this;
        }

        public Criteria andPayAmountSumNotIn(List<BigDecimal> values) {
            addCriterion("pay_amount_sum not in", values, "payAmountSum");
            return (Criteria) this;
        }

        public Criteria andPayAmountSumBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("pay_amount_sum between", value1, value2, "payAmountSum");
            return (Criteria) this;
        }

        public Criteria andPayAmountSumNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("pay_amount_sum not between", value1, value2, "payAmountSum");
            return (Criteria) this;
        }

        public Criteria andRefundAmountSumIsNull() {
            addCriterion("refund_amount_sum is null");
            return (Criteria) this;
        }

        public Criteria andRefundAmountSumIsNotNull() {
            addCriterion("refund_amount_sum is not null");
            return (Criteria) this;
        }

        public Criteria andRefundAmountSumEqualTo(BigDecimal value) {
            addCriterion("refund_amount_sum =", value, "refundAmountSum");
            return (Criteria) this;
        }

        public Criteria andRefundAmountSumNotEqualTo(BigDecimal value) {
            addCriterion("refund_amount_sum <>", value, "refundAmountSum");
            return (Criteria) this;
        }

        public Criteria andRefundAmountSumGreaterThan(BigDecimal value) {
            addCriterion("refund_amount_sum >", value, "refundAmountSum");
            return (Criteria) this;
        }

        public Criteria andRefundAmountSumGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("refund_amount_sum >=", value, "refundAmountSum");
            return (Criteria) this;
        }

        public Criteria andRefundAmountSumLessThan(BigDecimal value) {
            addCriterion("refund_amount_sum <", value, "refundAmountSum");
            return (Criteria) this;
        }

        public Criteria andRefundAmountSumLessThanOrEqualTo(BigDecimal value) {
            addCriterion("refund_amount_sum <=", value, "refundAmountSum");
            return (Criteria) this;
        }

        public Criteria andRefundAmountSumIn(List<BigDecimal> values) {
            addCriterion("refund_amount_sum in", values, "refundAmountSum");
            return (Criteria) this;
        }

        public Criteria andRefundAmountSumNotIn(List<BigDecimal> values) {
            addCriterion("refund_amount_sum not in", values, "refundAmountSum");
            return (Criteria) this;
        }

        public Criteria andRefundAmountSumBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("refund_amount_sum between", value1, value2, "refundAmountSum");
            return (Criteria) this;
        }

        public Criteria andRefundAmountSumNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("refund_amount_sum not between", value1, value2, "refundAmountSum");
            return (Criteria) this;
        }

        public Criteria andPayAmountIsNull() {
            addCriterion("pay_amount is null");
            return (Criteria) this;
        }

        public Criteria andPayAmountIsNotNull() {
            addCriterion("pay_amount is not null");
            return (Criteria) this;
        }

        public Criteria andPayAmountEqualTo(BigDecimal value) {
            addCriterion("pay_amount =", value, "payAmount");
            return (Criteria) this;
        }

        public Criteria andPayAmountNotEqualTo(BigDecimal value) {
            addCriterion("pay_amount <>", value, "payAmount");
            return (Criteria) this;
        }

        public Criteria andPayAmountGreaterThan(BigDecimal value) {
            addCriterion("pay_amount >", value, "payAmount");
            return (Criteria) this;
        }

        public Criteria andPayAmountGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("pay_amount >=", value, "payAmount");
            return (Criteria) this;
        }

        public Criteria andPayAmountLessThan(BigDecimal value) {
            addCriterion("pay_amount <", value, "payAmount");
            return (Criteria) this;
        }

        public Criteria andPayAmountLessThanOrEqualTo(BigDecimal value) {
            addCriterion("pay_amount <=", value, "payAmount");
            return (Criteria) this;
        }

        public Criteria andPayAmountIn(List<BigDecimal> values) {
            addCriterion("pay_amount in", values, "payAmount");
            return (Criteria) this;
        }

        public Criteria andPayAmountNotIn(List<BigDecimal> values) {
            addCriterion("pay_amount not in", values, "payAmount");
            return (Criteria) this;
        }

        public Criteria andPayAmountBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("pay_amount between", value1, value2, "payAmount");
            return (Criteria) this;
        }

        public Criteria andPayAmountNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("pay_amount not between", value1, value2, "payAmount");
            return (Criteria) this;
        }

        public Criteria andRefundAmountIsNull() {
            addCriterion("refund_amount is null");
            return (Criteria) this;
        }

        public Criteria andRefundAmountIsNotNull() {
            addCriterion("refund_amount is not null");
            return (Criteria) this;
        }

        public Criteria andRefundAmountEqualTo(BigDecimal value) {
            addCriterion("refund_amount =", value, "refundAmount");
            return (Criteria) this;
        }

        public Criteria andRefundAmountNotEqualTo(BigDecimal value) {
            addCriterion("refund_amount <>", value, "refundAmount");
            return (Criteria) this;
        }

        public Criteria andRefundAmountGreaterThan(BigDecimal value) {
            addCriterion("refund_amount >", value, "refundAmount");
            return (Criteria) this;
        }

        public Criteria andRefundAmountGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("refund_amount >=", value, "refundAmount");
            return (Criteria) this;
        }

        public Criteria andRefundAmountLessThan(BigDecimal value) {
            addCriterion("refund_amount <", value, "refundAmount");
            return (Criteria) this;
        }

        public Criteria andRefundAmountLessThanOrEqualTo(BigDecimal value) {
            addCriterion("refund_amount <=", value, "refundAmount");
            return (Criteria) this;
        }

        public Criteria andRefundAmountIn(List<BigDecimal> values) {
            addCriterion("refund_amount in", values, "refundAmount");
            return (Criteria) this;
        }

        public Criteria andRefundAmountNotIn(List<BigDecimal> values) {
            addCriterion("refund_amount not in", values, "refundAmount");
            return (Criteria) this;
        }

        public Criteria andRefundAmountBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("refund_amount between", value1, value2, "refundAmount");
            return (Criteria) this;
        }

        public Criteria andRefundAmountNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("refund_amount not between", value1, value2, "refundAmount");
            return (Criteria) this;
        }

        public Criteria andCumulativePayAmountIsNull() {
            addCriterion("cumulative_pay_amount is null");
            return (Criteria) this;
        }

        public Criteria andCumulativePayAmountIsNotNull() {
            addCriterion("cumulative_pay_amount is not null");
            return (Criteria) this;
        }

        public Criteria andCumulativePayAmountEqualTo(BigDecimal value) {
            addCriterion("cumulative_pay_amount =", value, "cumulativePayAmount");
            return (Criteria) this;
        }

        public Criteria andCumulativePayAmountNotEqualTo(BigDecimal value) {
            addCriterion("cumulative_pay_amount <>", value, "cumulativePayAmount");
            return (Criteria) this;
        }

        public Criteria andCumulativePayAmountGreaterThan(BigDecimal value) {
            addCriterion("cumulative_pay_amount >", value, "cumulativePayAmount");
            return (Criteria) this;
        }

        public Criteria andCumulativePayAmountGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("cumulative_pay_amount >=", value, "cumulativePayAmount");
            return (Criteria) this;
        }

        public Criteria andCumulativePayAmountLessThan(BigDecimal value) {
            addCriterion("cumulative_pay_amount <", value, "cumulativePayAmount");
            return (Criteria) this;
        }

        public Criteria andCumulativePayAmountLessThanOrEqualTo(BigDecimal value) {
            addCriterion("cumulative_pay_amount <=", value, "cumulativePayAmount");
            return (Criteria) this;
        }

        public Criteria andCumulativePayAmountIn(List<BigDecimal> values) {
            addCriterion("cumulative_pay_amount in", values, "cumulativePayAmount");
            return (Criteria) this;
        }

        public Criteria andCumulativePayAmountNotIn(List<BigDecimal> values) {
            addCriterion("cumulative_pay_amount not in", values, "cumulativePayAmount");
            return (Criteria) this;
        }

        public Criteria andCumulativePayAmountBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("cumulative_pay_amount between", value1, value2, "cumulativePayAmount");
            return (Criteria) this;
        }

        public Criteria andCumulativePayAmountNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("cumulative_pay_amount not between", value1, value2, "cumulativePayAmount");
            return (Criteria) this;
        }

        public Criteria andRemindPayAmountIsNull() {
            addCriterion("remind_pay_amount is null");
            return (Criteria) this;
        }

        public Criteria andRemindPayAmountIsNotNull() {
            addCriterion("remind_pay_amount is not null");
            return (Criteria) this;
        }

        public Criteria andRemindPayAmountEqualTo(BigDecimal value) {
            addCriterion("remind_pay_amount =", value, "remindPayAmount");
            return (Criteria) this;
        }

        public Criteria andRemindPayAmountNotEqualTo(BigDecimal value) {
            addCriterion("remind_pay_amount <>", value, "remindPayAmount");
            return (Criteria) this;
        }

        public Criteria andRemindPayAmountGreaterThan(BigDecimal value) {
            addCriterion("remind_pay_amount >", value, "remindPayAmount");
            return (Criteria) this;
        }

        public Criteria andRemindPayAmountGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("remind_pay_amount >=", value, "remindPayAmount");
            return (Criteria) this;
        }

        public Criteria andRemindPayAmountLessThan(BigDecimal value) {
            addCriterion("remind_pay_amount <", value, "remindPayAmount");
            return (Criteria) this;
        }

        public Criteria andRemindPayAmountLessThanOrEqualTo(BigDecimal value) {
            addCriterion("remind_pay_amount <=", value, "remindPayAmount");
            return (Criteria) this;
        }

        public Criteria andRemindPayAmountIn(List<BigDecimal> values) {
            addCriterion("remind_pay_amount in", values, "remindPayAmount");
            return (Criteria) this;
        }

        public Criteria andRemindPayAmountNotIn(List<BigDecimal> values) {
            addCriterion("remind_pay_amount not in", values, "remindPayAmount");
            return (Criteria) this;
        }

        public Criteria andRemindPayAmountBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("remind_pay_amount between", value1, value2, "remindPayAmount");
            return (Criteria) this;
        }

        public Criteria andRemindPayAmountNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("remind_pay_amount not between", value1, value2, "remindPayAmount");
            return (Criteria) this;
        }

        public Criteria andLastPayTimeIsNull() {
            addCriterion("last_pay_time is null");
            return (Criteria) this;
        }

        public Criteria andLastPayTimeIsNotNull() {
            addCriterion("last_pay_time is not null");
            return (Criteria) this;
        }

        public Criteria andLastPayTimeEqualTo(Date value) {
            addCriterion("last_pay_time =", value, "lastPayTime");
            return (Criteria) this;
        }

        public Criteria andLastPayTimeNotEqualTo(Date value) {
            addCriterion("last_pay_time <>", value, "lastPayTime");
            return (Criteria) this;
        }

        public Criteria andLastPayTimeGreaterThan(Date value) {
            addCriterion("last_pay_time >", value, "lastPayTime");
            return (Criteria) this;
        }

        public Criteria andLastPayTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("last_pay_time >=", value, "lastPayTime");
            return (Criteria) this;
        }

        public Criteria andLastPayTimeLessThan(Date value) {
            addCriterion("last_pay_time <", value, "lastPayTime");
            return (Criteria) this;
        }

        public Criteria andLastPayTimeLessThanOrEqualTo(Date value) {
            addCriterion("last_pay_time <=", value, "lastPayTime");
            return (Criteria) this;
        }

        public Criteria andLastPayTimeIn(List<Date> values) {
            addCriterion("last_pay_time in", values, "lastPayTime");
            return (Criteria) this;
        }

        public Criteria andLastPayTimeNotIn(List<Date> values) {
            addCriterion("last_pay_time not in", values, "lastPayTime");
            return (Criteria) this;
        }

        public Criteria andLastPayTimeBetween(Date value1, Date value2) {
            addCriterion("last_pay_time between", value1, value2, "lastPayTime");
            return (Criteria) this;
        }

        public Criteria andLastPayTimeNotBetween(Date value1, Date value2) {
            addCriterion("last_pay_time not between", value1, value2, "lastPayTime");
            return (Criteria) this;
        }

        public Criteria andCreateByIsNull() {
            addCriterion("create_by is null");
            return (Criteria) this;
        }

        public Criteria andCreateByIsNotNull() {
            addCriterion("create_by is not null");
            return (Criteria) this;
        }

        public Criteria andCreateByEqualTo(String value) {
            addCriterion("create_by =", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotEqualTo(String value) {
            addCriterion("create_by <>", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByGreaterThan(String value) {
            addCriterion("create_by >", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByGreaterThanOrEqualTo(String value) {
            addCriterion("create_by >=", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByLessThan(String value) {
            addCriterion("create_by <", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByLessThanOrEqualTo(String value) {
            addCriterion("create_by <=", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByLike(String value) {
            addCriterion("create_by like", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotLike(String value) {
            addCriterion("create_by not like", value, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByIn(List<String> values) {
            addCriterion("create_by in", values, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotIn(List<String> values) {
            addCriterion("create_by not in", values, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByBetween(String value1, String value2) {
            addCriterion("create_by between", value1, value2, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateByNotBetween(String value1, String value2) {
            addCriterion("create_by not between", value1, value2, "createBy");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNull() {
            addCriterion("create_date is null");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNotNull() {
            addCriterion("create_date is not null");
            return (Criteria) this;
        }

        public Criteria andCreateDateEqualTo(Date value) {
            addCriterion("create_date =", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotEqualTo(Date value) {
            addCriterion("create_date <>", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThan(Date value) {
            addCriterion("create_date >", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThanOrEqualTo(Date value) {
            addCriterion("create_date >=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThan(Date value) {
            addCriterion("create_date <", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThanOrEqualTo(Date value) {
            addCriterion("create_date <=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateIn(List<Date> values) {
            addCriterion("create_date in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotIn(List<Date> values) {
            addCriterion("create_date not in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateBetween(Date value1, Date value2) {
            addCriterion("create_date between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotBetween(Date value1, Date value2) {
            addCriterion("create_date not between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andLastUpdateByIsNull() {
            addCriterion("last_update_by is null");
            return (Criteria) this;
        }

        public Criteria andLastUpdateByIsNotNull() {
            addCriterion("last_update_by is not null");
            return (Criteria) this;
        }

        public Criteria andLastUpdateByEqualTo(String value) {
            addCriterion("last_update_by =", value, "lastUpdateBy");
            return (Criteria) this;
        }

        public Criteria andLastUpdateByNotEqualTo(String value) {
            addCriterion("last_update_by <>", value, "lastUpdateBy");
            return (Criteria) this;
        }

        public Criteria andLastUpdateByGreaterThan(String value) {
            addCriterion("last_update_by >", value, "lastUpdateBy");
            return (Criteria) this;
        }

        public Criteria andLastUpdateByGreaterThanOrEqualTo(String value) {
            addCriterion("last_update_by >=", value, "lastUpdateBy");
            return (Criteria) this;
        }

        public Criteria andLastUpdateByLessThan(String value) {
            addCriterion("last_update_by <", value, "lastUpdateBy");
            return (Criteria) this;
        }

        public Criteria andLastUpdateByLessThanOrEqualTo(String value) {
            addCriterion("last_update_by <=", value, "lastUpdateBy");
            return (Criteria) this;
        }

        public Criteria andLastUpdateByLike(String value) {
            addCriterion("last_update_by like", value, "lastUpdateBy");
            return (Criteria) this;
        }

        public Criteria andLastUpdateByNotLike(String value) {
            addCriterion("last_update_by not like", value, "lastUpdateBy");
            return (Criteria) this;
        }

        public Criteria andLastUpdateByIn(List<String> values) {
            addCriterion("last_update_by in", values, "lastUpdateBy");
            return (Criteria) this;
        }

        public Criteria andLastUpdateByNotIn(List<String> values) {
            addCriterion("last_update_by not in", values, "lastUpdateBy");
            return (Criteria) this;
        }

        public Criteria andLastUpdateByBetween(String value1, String value2) {
            addCriterion("last_update_by between", value1, value2, "lastUpdateBy");
            return (Criteria) this;
        }

        public Criteria andLastUpdateByNotBetween(String value1, String value2) {
            addCriterion("last_update_by not between", value1, value2, "lastUpdateBy");
            return (Criteria) this;
        }

        public Criteria andLastUpdateDateIsNull() {
            addCriterion("last_update_date is null");
            return (Criteria) this;
        }

        public Criteria andLastUpdateDateIsNotNull() {
            addCriterion("last_update_date is not null");
            return (Criteria) this;
        }

        public Criteria andLastUpdateDateEqualTo(Date value) {
            addCriterion("last_update_date =", value, "lastUpdateDate");
            return (Criteria) this;
        }

        public Criteria andLastUpdateDateNotEqualTo(Date value) {
            addCriterion("last_update_date <>", value, "lastUpdateDate");
            return (Criteria) this;
        }

        public Criteria andLastUpdateDateGreaterThan(Date value) {
            addCriterion("last_update_date >", value, "lastUpdateDate");
            return (Criteria) this;
        }

        public Criteria andLastUpdateDateGreaterThanOrEqualTo(Date value) {
            addCriterion("last_update_date >=", value, "lastUpdateDate");
            return (Criteria) this;
        }

        public Criteria andLastUpdateDateLessThan(Date value) {
            addCriterion("last_update_date <", value, "lastUpdateDate");
            return (Criteria) this;
        }

        public Criteria andLastUpdateDateLessThanOrEqualTo(Date value) {
            addCriterion("last_update_date <=", value, "lastUpdateDate");
            return (Criteria) this;
        }

        public Criteria andLastUpdateDateIn(List<Date> values) {
            addCriterion("last_update_date in", values, "lastUpdateDate");
            return (Criteria) this;
        }

        public Criteria andLastUpdateDateNotIn(List<Date> values) {
            addCriterion("last_update_date not in", values, "lastUpdateDate");
            return (Criteria) this;
        }

        public Criteria andLastUpdateDateBetween(Date value1, Date value2) {
            addCriterion("last_update_date between", value1, value2, "lastUpdateDate");
            return (Criteria) this;
        }

        public Criteria andLastUpdateDateNotBetween(Date value1, Date value2) {
            addCriterion("last_update_date not between", value1, value2, "lastUpdateDate");
            return (Criteria) this;
        }

        public Criteria andRemarksIsNull() {
            addCriterion("remarks is null");
            return (Criteria) this;
        }

        public Criteria andRemarksIsNotNull() {
            addCriterion("remarks is not null");
            return (Criteria) this;
        }

        public Criteria andRemarksEqualTo(String value) {
            addCriterion("remarks =", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotEqualTo(String value) {
            addCriterion("remarks <>", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksGreaterThan(String value) {
            addCriterion("remarks >", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksGreaterThanOrEqualTo(String value) {
            addCriterion("remarks >=", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksLessThan(String value) {
            addCriterion("remarks <", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksLessThanOrEqualTo(String value) {
            addCriterion("remarks <=", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksLike(String value) {
            addCriterion("remarks like", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotLike(String value) {
            addCriterion("remarks not like", value, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksIn(List<String> values) {
            addCriterion("remarks in", values, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotIn(List<String> values) {
            addCriterion("remarks not in", values, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksBetween(String value1, String value2) {
            addCriterion("remarks between", value1, value2, "remarks");
            return (Criteria) this;
        }

        public Criteria andRemarksNotBetween(String value1, String value2) {
            addCriterion("remarks not between", value1, value2, "remarks");
            return (Criteria) this;
        }

        public Criteria andDelFlagIsNull() {
            addCriterion("del_flag is null");
            return (Criteria) this;
        }

        public Criteria andDelFlagIsNotNull() {
            addCriterion("del_flag is not null");
            return (Criteria) this;
        }

        public Criteria andDelFlagEqualTo(String value) {
            addCriterion("del_flag =", value, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagNotEqualTo(String value) {
            addCriterion("del_flag <>", value, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagGreaterThan(String value) {
            addCriterion("del_flag >", value, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagGreaterThanOrEqualTo(String value) {
            addCriterion("del_flag >=", value, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagLessThan(String value) {
            addCriterion("del_flag <", value, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagLessThanOrEqualTo(String value) {
            addCriterion("del_flag <=", value, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagLike(String value) {
            addCriterion("del_flag like", value, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagNotLike(String value) {
            addCriterion("del_flag not like", value, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagIn(List<String> values) {
            addCriterion("del_flag in", values, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagNotIn(List<String> values) {
            addCriterion("del_flag not in", values, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagBetween(String value1, String value2) {
            addCriterion("del_flag between", value1, value2, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagNotBetween(String value1, String value2) {
            addCriterion("del_flag not between", value1, value2, "delFlag");
            return (Criteria) this;
        }

        public Criteria andCommodityTotalAmountIsNull() {
            addCriterion("commodity_total_amount is null");
            return (Criteria) this;
        }

        public Criteria andCommodityTotalAmountIsNotNull() {
            addCriterion("commodity_total_amount is not null");
            return (Criteria) this;
        }

        public Criteria andCommodityTotalAmountEqualTo(BigDecimal value) {
            addCriterion("commodity_total_amount =", value, "commodityTotalAmount");
            return (Criteria) this;
        }

        public Criteria andCommodityTotalAmountNotEqualTo(BigDecimal value) {
            addCriterion("commodity_total_amount <>", value, "commodityTotalAmount");
            return (Criteria) this;
        }

        public Criteria andCommodityTotalAmountGreaterThan(BigDecimal value) {
            addCriterion("commodity_total_amount >", value, "commodityTotalAmount");
            return (Criteria) this;
        }

        public Criteria andCommodityTotalAmountGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("commodity_total_amount >=", value, "commodityTotalAmount");
            return (Criteria) this;
        }

        public Criteria andCommodityTotalAmountLessThan(BigDecimal value) {
            addCriterion("commodity_total_amount <", value, "commodityTotalAmount");
            return (Criteria) this;
        }

        public Criteria andCommodityTotalAmountLessThanOrEqualTo(BigDecimal value) {
            addCriterion("commodity_total_amount <=", value, "commodityTotalAmount");
            return (Criteria) this;
        }

        public Criteria andCommodityTotalAmountIn(List<BigDecimal> values) {
            addCriterion("commodity_total_amount in", values, "commodityTotalAmount");
            return (Criteria) this;
        }

        public Criteria andCommodityTotalAmountNotIn(List<BigDecimal> values) {
            addCriterion("commodity_total_amount not in", values, "commodityTotalAmount");
            return (Criteria) this;
        }

        public Criteria andCommodityTotalAmountBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("commodity_total_amount between", value1, value2, "commodityTotalAmount");
            return (Criteria) this;
        }

        public Criteria andCommodityTotalAmountNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("commodity_total_amount not between", value1, value2, "commodityTotalAmount");
            return (Criteria) this;
        }

        public Criteria andSupplyTotalAmountIsNull() {
            addCriterion("supply_total_amount is null");
            return (Criteria) this;
        }

        public Criteria andSupplyTotalAmountIsNotNull() {
            addCriterion("supply_total_amount is not null");
            return (Criteria) this;
        }

        public Criteria andSupplyTotalAmountEqualTo(BigDecimal value) {
            addCriterion("supply_total_amount =", value, "supplyTotalAmount");
            return (Criteria) this;
        }

        public Criteria andSupplyTotalAmountNotEqualTo(BigDecimal value) {
            addCriterion("supply_total_amount <>", value, "supplyTotalAmount");
            return (Criteria) this;
        }

        public Criteria andSupplyTotalAmountGreaterThan(BigDecimal value) {
            addCriterion("supply_total_amount >", value, "supplyTotalAmount");
            return (Criteria) this;
        }

        public Criteria andSupplyTotalAmountGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("supply_total_amount >=", value, "supplyTotalAmount");
            return (Criteria) this;
        }

        public Criteria andSupplyTotalAmountLessThan(BigDecimal value) {
            addCriterion("supply_total_amount <", value, "supplyTotalAmount");
            return (Criteria) this;
        }

        public Criteria andSupplyTotalAmountLessThanOrEqualTo(BigDecimal value) {
            addCriterion("supply_total_amount <=", value, "supplyTotalAmount");
            return (Criteria) this;
        }

        public Criteria andSupplyTotalAmountIn(List<BigDecimal> values) {
            addCriterion("supply_total_amount in", values, "supplyTotalAmount");
            return (Criteria) this;
        }

        public Criteria andSupplyTotalAmountNotIn(List<BigDecimal> values) {
            addCriterion("supply_total_amount not in", values, "supplyTotalAmount");
            return (Criteria) this;
        }

        public Criteria andSupplyTotalAmountBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("supply_total_amount between", value1, value2, "supplyTotalAmount");
            return (Criteria) this;
        }

        public Criteria andSupplyTotalAmountNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("supply_total_amount not between", value1, value2, "supplyTotalAmount");
            return (Criteria) this;
        }

        public Criteria andDeductAmountIsNull() {
            addCriterion("deduct_amount is null");
            return (Criteria) this;
        }

        public Criteria andDeductAmountIsNotNull() {
            addCriterion("deduct_amount is not null");
            return (Criteria) this;
        }

        public Criteria andDeductAmountEqualTo(BigDecimal value) {
            addCriterion("deduct_amount =", value, "deductAmount");
            return (Criteria) this;
        }

        public Criteria andDeductAmountNotEqualTo(BigDecimal value) {
            addCriterion("deduct_amount <>", value, "deductAmount");
            return (Criteria) this;
        }

        public Criteria andDeductAmountGreaterThan(BigDecimal value) {
            addCriterion("deduct_amount >", value, "deductAmount");
            return (Criteria) this;
        }

        public Criteria andDeductAmountGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("deduct_amount >=", value, "deductAmount");
            return (Criteria) this;
        }

        public Criteria andDeductAmountLessThan(BigDecimal value) {
            addCriterion("deduct_amount <", value, "deductAmount");
            return (Criteria) this;
        }

        public Criteria andDeductAmountLessThanOrEqualTo(BigDecimal value) {
            addCriterion("deduct_amount <=", value, "deductAmount");
            return (Criteria) this;
        }

        public Criteria andDeductAmountIn(List<BigDecimal> values) {
            addCriterion("deduct_amount in", values, "deductAmount");
            return (Criteria) this;
        }

        public Criteria andDeductAmountNotIn(List<BigDecimal> values) {
            addCriterion("deduct_amount not in", values, "deductAmount");
            return (Criteria) this;
        }

        public Criteria andDeductAmountBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("deduct_amount between", value1, value2, "deductAmount");
            return (Criteria) this;
        }

        public Criteria andDeductAmountNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("deduct_amount not between", value1, value2, "deductAmount");
            return (Criteria) this;
        }
    }
}