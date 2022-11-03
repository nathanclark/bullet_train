## Address




rails g model Company team:references  name:string legal_name ein
bin/super-scaffold crud Company Team name:text_field legal_name:text_field ein:text_field

rails g PostalAddress company:references address_type:string street1:string street2:string city:string state:string zipcode:string

rails g model LedgerAccount team:references ledger_account_number:string account_types:integer account_statuses:integer posting_types:integer alternate_account_number:string visible:boolean reporting_excluded:boolean  parent_id:integer

bin/super-scaffold crud LedgerAccount Ledger,Team ledger_account_number:text_field account_type:text_field account_status:text_field posting_type:text_field alternate_account_number:text_field  parent_id:super_select{class_name=LedgerAccount}
bin/super-scaffold crud JournalEntryDetail JournalEntry amount:text_field description:text_area ledger_account_id:super_select{class_name=LedgerAccount}

rails g model Vendor team:references name:string vendor_number:string is_payee:boolean address1:string address2:string city:string region:string zip_code:string phone_number:string ledger_account:references

bin/super-scaffold crud Vendor Team  name:text_field vendor_number:text_field is_payee:boolean address1:text_field address2:text_field city:text_field region:text_field zip_code:text_field phone_number:text_field

rails g model VendorInvoice team:references vendor:references invoice_type:string invoice_total:float reference_number:string invoice_number:string invoice_date:date gl_posting_date:date discount_total:float discount_expiration_date:date


bin/super-scaffold crud VendorInvoice Vendor, Team  invoice_type:text_field invoice_total:text_field reference_number:text_field invoice_number:text_field invoice_date:date gl_posting_date:date discount_total:text_field discount_expiration_date:date
test

rails g model JournalEntryDetail journal_entry:references team:references line:integer ledger_account:references amount:float description:text

rails g model Report team:references name:string file_path:string parameters:json

bin/super-scaffold crud Report Team name:text_field file_path:text_field parameters:text_area

rails g model ReportExecuted report:references team:references name:string file_path:string parameters:json

bin/super-scaffold crud ReportExecuted Report,Team name:text_field file_path:text_field parameters:text_area

rails g model AccountsPayableSettings team:references 

rails g model AccountsPayableSettings team:references vendor_import:attachment bank_gl_ledger:integer company_address1:string company_address2:string company_city:string company_state:string company_zipcode:string phone_number:string


rails g model AccountsReceivableSetting team:references customer_import:attachment receivable_ledger_id:integer cash_ledger_id:integer check_ledger_id:integer journal_entry_ledger_id:integer charge_off_ledger_id:integer  company_address1:string company_address2:string company_city:string company_state:string company_zipcode:string phone_number:string statement_date:date statement_form:string statement_min_threshold_amount:float


Employee.columns.each do |c| puts "change_column_comment(:employees, :#{c.name}, from: "", to: '{\"type\": \"human_name\"}')"  end
 

bin/super-scaffold crud AccountsReceivableSetting Team receivable_ledger_id:super_select[class_name=LedgerAccount] cash_ledger_id:super_select[class_name=LedgerAccount] check_ledger_id:super_select[class_name=LedgerAccount] journal_entry_ledger_id:super_select[class_name=LedgerAccount] charge_off_ledger_id:super_select[class_name=LedgerAccount]  company_address1:text_field company_address2:text_field company_city:text_field company_state:text_field company_zipcode:text_field phone_number:text_field statement_date:date_field statement_form:text_field statement_min_threshold_amount:text_field customer_import:file_field


Running tests:  sudo circleci local execute --job 'Minitest'

rails g model EmployeeDepartment name:string
bin/super-scaffold crud EmployeeDepartment Team name:text_field


rails g model PayrollSchedule name:string occurrence:string 
rails g model PayrollPayType name:string
rails g model PayrollFederalFilingStatus name:string
rails g model PayrollFederalWithholdingAllowance name:string
rails g model EmployeeDeduction code:string description:string employee:references calculation_method:string deduction_value:float state_withholding:boolean region_state:string ytd_max:float

rails g model Employee employee_number:string employee_status:string first_name:string middle_name:string last_name:string address1:string address2:string city:string region_state:string phone_number:string employee_department:references hire_date:datetime termination:datetime payroll_schedule:references payroll_federal_filing_status:references ledger_account:references payroll_federal_withholding_allowance:references payroll_federal_withholding_amount:float personal_time_balance:float vacation_time_balance:float sick_leave_balance:float compensation_increase_date:datetime next_compensation_increase_date:datetime marital_tax_status:string notes:text 

rails g model EmployeeETO eto_type:string

rails g model Employee 
    employee_number:string 
    employee_status:string 
    first_name:string 
    middle_name:string 
    last_name:string 
    address1:string address2:string city:string region_state:string 
    phone_number:string 
    employee_department:references 
    hire_date:datetime 
    termination:datetime 
    termination_reason:string 
    payroll_schedule:references 
    payroll_federal_filing_status:references 
    ledger_account:references 
    payroll_federal_withholding_allowance:references 
    payroll_federal_withholding_amount:float 
    personal_time_balance:float 
    vacation_time_balance:float 
    sick_leave_balance:float 
    compensation_increase_date:datetime 
    next_compensation_increase_date:datetime
    marital_tax_status:string 
    notes:text 


add_reference(:products, :supplier, foreign_key: { to_table: :firms })
t.references :expense_ledger_account, null: false, foreign_key: true, foreign_key: { to_table: :ledger_account })

bin/super-scaffold crud Employee Team employee_number:text_field employee_status:text_field first_name:text_field middle_name:text_field last_name:text_field address1:text_field address2:text_field city:text_field region_state:text_field phone_number:text_field employee_department:super_select{class_name=EmployeeDepartment} hire_date:date_field termination:date_field payroll_schedule:super_select{class_name=PayrollSchedule} payroll_federal_filing_status:super_select{class_name=PayrollFederalFilingStatus} expense_ledger_account:super_select{class_name=LedgerAccount} payroll_federal_withholding_allowance:super_select{class_name=PayrollFederalWithholdingAllowance}  payroll_federal_withholding_amount:text_field personal_time_balance:text_field vacation_time_balance:text_field sick_leave_balance:text_field compensation_increase_date:date_field next_compensation_increase_date:date_field marital_tax_status:text_field notes:trix_editor 

rails g migration AddFieldsToEmployees email:string ssn:string zip_code:string tax_federal_exemptions:string tax_region_state:string tax_region_state_exemptions:string tax_filing_status:integer tax_other_income:float tax_deductions:float tax_extra_withholdings:float tax_dependants:integer


rails g migration AddEEOReportingToEmployee eeo_gender:integer eeo_ethnicity:string eeo_dob:date eeo_job_category:integer
 rails g migration AddDirectReportsToEmployees manager_id:integer


      
