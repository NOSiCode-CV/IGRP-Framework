function tConvert(e){var e=new Date(e),e=(time_s=e.getHours()+":"+e.getMinutes()).split(":"),t=e[0],e=e[1],n=12<=t?"PM":"AM";return(t=(t%=12)||12)+":"+(e=e<10?"0"+e:e)+" "+n}var str_dt=function(e){var e=new Date(e),t=""+["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"][e.getMonth()],n=""+e.getDate(),e=e.getFullYear();return t.length<2&&(t="0"+t),[(n=n.length<2?"0"+n:n)+" "+t,e].join(", ")};if(null!==localStorage.getItem("invoices-list")&&null!==localStorage.getItem("option")&&null!==localStorage.getItem("invoice_no")){var invoices_list=localStorage.getItem("invoices-list"),options=localStorage.getItem("option"),invoice_no=localStorage.getItem("invoice_no"),invoices=JSON.parse(invoices_list);let t=invoices.find(e=>e.invoice_no===invoice_no);if(""!=t&&"view-invoice"==options){let e;switch(t.status){case"Paid":e="success";break;case"Refund":e="primary";break;case"Unpaid":e="warning";break;case"Cancel":e="danger"}document.getElementById("legal-register-no").innerHTML=t.company_details.legal_registration_no,document.getElementById("email").innerHTML=t.company_details.email,document.getElementById("website").href=t.company_details.website,document.getElementById("website").innerHTML=t.company_details.website,document.getElementById("contact-no").innerHTML=t.company_details.contact_no,document.getElementById("address-details").innerHTML=t.company_details.address,document.getElementById("zip-code").innerHTML=t.company_details.zip_code,document.getElementById("invoice-no").innerHTML=t.invoice_no,document.getElementById("invoice-date").innerHTML=str_dt(t.date),document.getElementById("invoice-time").innerHTML=tConvert(t.date),document.getElementById("payment-status").innerHTML=t.status,document.getElementById("payment-status").classList.replace("badge-soft-success","badge-soft-"+e),document.getElementById("total-amount").innerHTML=t.invoice_amount,document.getElementById("billing-name").innerHTML=t.billing_address.full_name,document.getElementById("billing-address-line-1").innerHTML=t.billing_address.address,document.getElementById("billing-phone-no").innerHTML=t.billing_address.phone,document.getElementById("billing-tax-no").innerHTML=t.billing_address.tax,document.getElementById("shipping-name").innerHTML=t.shipping_address.full_name,document.getElementById("shipping-address-line-1").innerHTML=t.shipping_address.address,document.getElementById("shipping-phone-no").innerHTML=t.shipping_address.phone,document.getElementById("products-list").innerHTML="";var paroducts_list=t.prducts,counter=1,order_summary=(Array.from(paroducts_list).forEach(function(e){product_data=`
                <tr>
                    <th scope="row">`+counter+`</th>
                    <td class="text-start">
                        <span class="fw-medium">`+e.product_name+`</span>
                        <p class="text-muted mb-0">`+e.product_details+`</p>
                    </td>
                    <td>`+e.rates+`</td>
                    <td>`+e.quantity+`</td>
                    <td class="text-end">$`+e.amount+`</td>
                </tr>`,document.getElementById("products-list").innerHTML+=product_data,counter++}),`
            <tr class="border-top border-top-dashed mt-2">
                <td colspan="3"></td>
                <td colspan="2" class="fw-medium p-0">
                    <table class="table table-borderless text-start table-nowrap align-middle mb-0">
                        <tbody>
                            <tr>
                                <td>Sub Total</td>
                                <td class="text-end">$`+t.order_summary.sub_total+`</td>
                            </tr>
                            <tr>
                                <td>Estimated Tax (12.5%)</td>
                                <td class="text-end">$`+t.order_summary.estimated_tex+`</td>
                            </tr>
                            <tr>
                                <td>Discount <small class="text-muted">(VELZON15)</small></td>
                                <td class="text-end">- $`+t.order_summary.discount+`</td>
                            </tr>
                            <tr>
                                <td>Shipping Charge</td>
                                <td class="text-end">$`+t.order_summary.shipping_charge+`</td>
                            </tr>
                            <tr class="border-top border-top-dashed">
                                <th scope="row">Total Amount</th>
                                <td class="text-end">$`+t.order_summary.total_amount+`</td>
                            </tr>
                        </tbody>
                    </table><!--end table-->
                </td>
            </tr>`);document.getElementById("products-list").innerHTML+=order_summary,document.getElementById("payment-method").innerHTML=t.payment_details.payment_method,document.getElementById("card-holder-name").innerHTML=t.payment_details.card_holder_name,document.getElementById("card-number").innerHTML=t.payment_details.card_number,document.getElementById("card-total-amount").innerHTML=t.payment_details.total_amount,document.getElementById("note").innerHTML=t.notes}}