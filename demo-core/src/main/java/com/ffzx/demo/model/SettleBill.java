package com.ffzx.demo.model;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

@Table(name = "settle_bill")
public class SettleBill {
    @Id
    private String id;

    /**
     * 结款单号
     */
    private String code;

    /**
     * 付款状态
     */
    @Column(name = "pay_status")
    private String payStatus;

    /**
     * 供应商编码
     */
    @Column(name = "vendor_code")
    private String vendorCode;

    /**
     * 供应商名称
     */
    @Column(name = "vendor_name")
    private String vendorName;

    /**
     * 应付账单金额总计
     */
    @Column(name = "pay_amount_sum")
    private BigDecimal payAmountSum;

    /**
     * 应退账单金额总计
     */
    @Column(name = "refund_amount_sum")
    private BigDecimal refundAmountSum;

    /**
     * 应付款金额
     */
    @Column(name = "pay_amount")
    private BigDecimal payAmount;

    /**
     * 应退款金额
     */
    @Column(name = "refund_amount")
    private BigDecimal refundAmount;

    /**
     * 累计付款金额
     */
    @Column(name = "cumulative_pay_amount")
    private BigDecimal cumulativePayAmount;

    /**
     * 剩余付款金额
     */
    @Column(name = "remind_pay_amount")
    private BigDecimal remindPayAmount;

    /**
     * 上次付款时间
     */
    @Column(name = "last_pay_time")
    private Date lastPayTime;

    /**
     * 创建者
     */
    @Column(name = "create_by")
    private String createBy;

    /**
     * 创建时间
     */
    @Column(name = "create_date")
    private Date createDate;

    /**
     * 最后修改人
     */
    @Column(name = "last_update_by")
    private String lastUpdateBy;

    /**
     * 最后修改时间
     */
    @Column(name = "last_update_date")
    private Date lastUpdateDate;

    /**
     * 备注
     */
    private String remarks;

    /**
     * 删除标记（0:正常,1:已删除）
     */
    @Column(name = "del_flag")
    private String delFlag;

    /**
     * 商品总价合计
     */
    @Column(name = "commodity_total_amount")
    private BigDecimal commodityTotalAmount;

    /**
     * 供货价金额总计
     */
    @Column(name = "supply_total_amount")
    private BigDecimal supplyTotalAmount;

    /**
     * 扣点金额总计
     */
    @Column(name = "deduct_amount")
    private BigDecimal deductAmount;

    /**
     * @return id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * 获取结款单号
     *
     * @return code - 结款单号
     */
    public String getCode() {
        return code;
    }

    /**
     * 设置结款单号
     *
     * @param code 结款单号
     */
    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    /**
     * 获取付款状态
     *
     * @return pay_status - 付款状态
     */
    public String getPayStatus() {
        return payStatus;
    }

    /**
     * 设置付款状态
     *
     * @param payStatus 付款状态
     */
    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus == null ? null : payStatus.trim();
    }

    /**
     * 获取供应商编码
     *
     * @return vendor_code - 供应商编码
     */
    public String getVendorCode() {
        return vendorCode;
    }

    /**
     * 设置供应商编码
     *
     * @param vendorCode 供应商编码
     */
    public void setVendorCode(String vendorCode) {
        this.vendorCode = vendorCode == null ? null : vendorCode.trim();
    }

    /**
     * 获取供应商名称
     *
     * @return vendor_name - 供应商名称
     */
    public String getVendorName() {
        return vendorName;
    }

    /**
     * 设置供应商名称
     *
     * @param vendorName 供应商名称
     */
    public void setVendorName(String vendorName) {
        this.vendorName = vendorName == null ? null : vendorName.trim();
    }

    /**
     * 获取应付账单金额总计
     *
     * @return pay_amount_sum - 应付账单金额总计
     */
    public BigDecimal getPayAmountSum() {
        return payAmountSum;
    }

    /**
     * 设置应付账单金额总计
     *
     * @param payAmountSum 应付账单金额总计
     */
    public void setPayAmountSum(BigDecimal payAmountSum) {
        this.payAmountSum = payAmountSum;
    }

    /**
     * 获取应退账单金额总计
     *
     * @return refund_amount_sum - 应退账单金额总计
     */
    public BigDecimal getRefundAmountSum() {
        return refundAmountSum;
    }

    /**
     * 设置应退账单金额总计
     *
     * @param refundAmountSum 应退账单金额总计
     */
    public void setRefundAmountSum(BigDecimal refundAmountSum) {
        this.refundAmountSum = refundAmountSum;
    }

    /**
     * 获取应付款金额
     *
     * @return pay_amount - 应付款金额
     */
    public BigDecimal getPayAmount() {
        return payAmount;
    }

    /**
     * 设置应付款金额
     *
     * @param payAmount 应付款金额
     */
    public void setPayAmount(BigDecimal payAmount) {
        this.payAmount = payAmount;
    }

    /**
     * 获取应退款金额
     *
     * @return refund_amount - 应退款金额
     */
    public BigDecimal getRefundAmount() {
        return refundAmount;
    }

    /**
     * 设置应退款金额
     *
     * @param refundAmount 应退款金额
     */
    public void setRefundAmount(BigDecimal refundAmount) {
        this.refundAmount = refundAmount;
    }

    /**
     * 获取累计付款金额
     *
     * @return cumulative_pay_amount - 累计付款金额
     */
    public BigDecimal getCumulativePayAmount() {
        return cumulativePayAmount;
    }

    /**
     * 设置累计付款金额
     *
     * @param cumulativePayAmount 累计付款金额
     */
    public void setCumulativePayAmount(BigDecimal cumulativePayAmount) {
        this.cumulativePayAmount = cumulativePayAmount;
    }

    /**
     * 获取剩余付款金额
     *
     * @return remind_pay_amount - 剩余付款金额
     */
    public BigDecimal getRemindPayAmount() {
        return remindPayAmount;
    }

    /**
     * 设置剩余付款金额
     *
     * @param remindPayAmount 剩余付款金额
     */
    public void setRemindPayAmount(BigDecimal remindPayAmount) {
        this.remindPayAmount = remindPayAmount;
    }

    /**
     * 获取上次付款时间
     *
     * @return last_pay_time - 上次付款时间
     */
    public Date getLastPayTime() {
        return lastPayTime;
    }

    /**
     * 设置上次付款时间
     *
     * @param lastPayTime 上次付款时间
     */
    public void setLastPayTime(Date lastPayTime) {
        this.lastPayTime = lastPayTime;
    }

    /**
     * 获取创建者
     *
     * @return create_by - 创建者
     */
    public String getCreateBy() {
        return createBy;
    }

    /**
     * 设置创建者
     *
     * @param createBy 创建者
     */
    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }

    /**
     * 获取创建时间
     *
     * @return create_date - 创建时间
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * 设置创建时间
     *
     * @param createDate 创建时间
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * 获取最后修改人
     *
     * @return last_update_by - 最后修改人
     */
    public String getLastUpdateBy() {
        return lastUpdateBy;
    }

    /**
     * 设置最后修改人
     *
     * @param lastUpdateBy 最后修改人
     */
    public void setLastUpdateBy(String lastUpdateBy) {
        this.lastUpdateBy = lastUpdateBy == null ? null : lastUpdateBy.trim();
    }

    /**
     * 获取最后修改时间
     *
     * @return last_update_date - 最后修改时间
     */
    public Date getLastUpdateDate() {
        return lastUpdateDate;
    }

    /**
     * 设置最后修改时间
     *
     * @param lastUpdateDate 最后修改时间
     */
    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    /**
     * 获取备注
     *
     * @return remarks - 备注
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * 设置备注
     *
     * @param remarks 备注
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    /**
     * 获取删除标记（0:正常,1:已删除）
     *
     * @return del_flag - 删除标记（0:正常,1:已删除）
     */
    public String getDelFlag() {
        return delFlag;
    }

    /**
     * 设置删除标记（0:正常,1:已删除）
     *
     * @param delFlag 删除标记（0:正常,1:已删除）
     */
    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag == null ? null : delFlag.trim();
    }

    /**
     * 获取商品总价合计
     *
     * @return commodity_total_amount - 商品总价合计
     */
    public BigDecimal getCommodityTotalAmount() {
        return commodityTotalAmount;
    }

    /**
     * 设置商品总价合计
     *
     * @param commodityTotalAmount 商品总价合计
     */
    public void setCommodityTotalAmount(BigDecimal commodityTotalAmount) {
        this.commodityTotalAmount = commodityTotalAmount;
    }

    /**
     * 获取供货价金额总计
     *
     * @return supply_total_amount - 供货价金额总计
     */
    public BigDecimal getSupplyTotalAmount() {
        return supplyTotalAmount;
    }

    /**
     * 设置供货价金额总计
     *
     * @param supplyTotalAmount 供货价金额总计
     */
    public void setSupplyTotalAmount(BigDecimal supplyTotalAmount) {
        this.supplyTotalAmount = supplyTotalAmount;
    }

    /**
     * 获取扣点金额总计
     *
     * @return deduct_amount - 扣点金额总计
     */
    public BigDecimal getDeductAmount() {
        return deductAmount;
    }

    /**
     * 设置扣点金额总计
     *
     * @param deductAmount 扣点金额总计
     */
    public void setDeductAmount(BigDecimal deductAmount) {
        this.deductAmount = deductAmount;
    }
}