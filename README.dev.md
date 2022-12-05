## Address




rails g model Company team:references  name:string legal_name ein
bin/super-scaffold crud Company Team name:text_field legal_name:text_field ein:text_field

rails g PostalAddress company:references address_type:string street1:string street2:string city:string state:string zipcode:string
bin/super-scaffold crud PostalAddress Company,Team address_type:text_field street1:text_field street2:text_field city:text_field state:text_field zipcode:text_field
name:text_field legal_name:text_field ein:text_field

rails g model LedgerAccount title company:references ledger_account_number:string account_type account_status posting_type alternate_account_number visible:boolean reporting_excluded:boolean  parent_id:integer
rails g model LedgerEntry company:references post_date:date status user:references note:text source_type fiscal_period
bin/super-scaffold crud LedgerEntry Company post_date:date_field status:super_select note:trix_editor source_type:super_select fiscal_period:super_select


rails g model LedgerEntryDetail ledger_entry:references ledger_account:references amount:float note order_number:integer
bin/super-scaffold crud LedgerEntryDetail LedgerEntry,Company,Team order_number:text_field amount:text_field note:text_field ledger_account:super_select{class_name=LedgerAccount}


bin/super-scaffold crud LedgerAccount Company,Team title:text_field ledger_account_number:text_field account_type:super_select account_status:super_select posting_type:super_select alternate_account_number:text_field  parent_id:super_select{class_name=LedgerAccount}
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

rails g migration AddEEOReportingToEmployee eeo_gender:integer eeo_ethnicity:string eeo_dob:date eeo_job_category:
integer
rails g migration AddDirectReportsToEmployees manager_id:integer
lsof -i :3000 | awk '{system("kill -9 " $2)}' && rm tmp/pids/server.pid

rails g model Contact company:references team:references contact_type first_name last_name title email fax_number
cell_number work_number social_link cloudinary_image company_role
bin/super-scaffold crud Contact Company,Team contact_type:super_select first_name:text_field last_name:text_field title:
text_field email:email_field fax_number:phone_field cell_number:phone_field work_number:phone_field social_link:
text_field cloudinary_image:cloudinary_image company_role:text_field

pg_dump.exe --dbname=petrobooks3_development
--file=/home/nathan/source/rnd/bullet_train_starter/backups/petrobooks3_development__202211251938.sql --create
--username=postgres --host=localhost --port=5432

This application is built with Bullet Train. A copy of the Bullet Train Developer Documentation is included in this
repository to ensure it always stays in sync with how things work on this specific application.

bin/super-scaffold crud LedgerAccount Ledger,Team ledger_account_number:text_field account_type:text_field
account_status:text_field posting_type:text_field alternate_account_number:text_field visible:boolean_button_value
reporting_excluded:boolean_button_value parent_id:super_select[class_name=LedgerAccount] bin/super-scaffold crud
JournalEntryDetail JournalEntry amount:text_field description:text_area ledger_account_id:
super_select[class_name=LedgerAccount]

rails g model Vendor company:references name:string vendor_number:string is_payee:boolean address1:string address2:
string
city:string region:string zip_code:string phone_number:string ledger_account:references

bin/super-scaffold crud Vendor Team name:text_field vendor_number:text_field is_payee:boolean address1:text_field
address2:text_field city:text_field region:text_field zip_code:text_field phone_number:text_field

rails g model VendorInvoice team:references vendor:references invoice_type:string invoice_total:float reference_number:
string invoice_number:string invoice_date:date gl_posting_date:date discount_total:float discount_expiration_date:date

bin/super-scaffold crud VendorInvoice Vendor, Team invoice_type:text_field invoice_total:text_field reference_number:
text_field invoice_number:text_field invoice_date:date gl_posting_date:date discount_total:text_field
discount_expiration_date:date test

rails g model JournalEntryDetail journal_entry:references team:references line:integer ledger_account:references amount:
float description:text

rails g model Report team:references name:string file_path:string parameters:json

bin/super-scaffold crud Report Team name:text_field file_path:text_field parameters:text_area

rails g model ReportExecuted report:references team:references name:string file_path:string parameters:json

bin/super-scaffold crud ReportExecuted Report,Team name:text_field file_path:text_field parameters:text_area

rails g model AccountsPayableSettings team:references

rails g model AccountsPayableSettings team:references vendor_import:attachment bank_gl_ledger:integer company_address1:
string company_address2:string company_city:string company_state:string company_zipcode:string phone_number:string

rails g model AccountsReceivableSetting team:references customer_import:attachment receivable_ledger_id:integer
cash_ledger_id:integer check_ledger_id:integer journal_entry_ledger_id:integer charge_off_ledger_id:integer
company_address1:string company_address2:string company_city:string company_state:string company_zipcode:string
phone_number:string statement_date:date statement_form:string statement_min_threshold_amount:float

Employee.columns.each do |c| puts "change_column_comment(:employees, :#{c.name}, from: "", to: '{"type": "human_name"
}')" end

bin/super-scaffold crud AccountsReceivableSetting Team receivable_ledger_id:super_select[class_name=LedgerAccount]
cash_ledger_id:super_select[class_name=LedgerAccount] check_ledger_id:super_select[class_name=LedgerAccount]
journal_entry_ledger_id:super_select[class_name=LedgerAccount] charge_off_ledger_id:
super_select[class_name=LedgerAccount] company_address1:text_field company_address2:text_field company_city:text_field
company_state:text_field company_zipcode:text_field phone_number:text_field statement_date:date_field statement_form:
text_field statement_min_threshold_amount:text_field customer_import:file_field

Running tests: sudo circleci local execute --job 'Minitest'

rails g model EmployeeDepartment name:string bin/super-scaffold crud EmployeeDepartment Team name:text_field

rails g model PayrollSchedule name:string occurrence:string rails g model PayrollPayType name:string rails g model
PayrollFederalFilingStatus name:string rails g model PayrollFederalWithholdingAllowance name:string rails g model
EmployeeDeduction code:string description:string employee:references calculation_method:string deduction_value:float
state_withholding:boolean region_state:string ytd_max:float

rails g model Employee employee_number:string employee_status:string first_name:string middle_name:string last_name:
string address1:string address2:string city:string region_state:string phone_number:string employee_department:
references hire_date:datetime termination:datetime payroll_schedule:references payroll_federal_filing_status:references
ledger_account:references payroll_federal_withholding_allowance:references payroll_federal_withholding_amount:float
personal_time_balance:float vacation_time_balance:float sick_leave_balance:float compensation_increase_date:datetime
next_compensation_increase_date:datetime marital_tax_status:string notes:text

rails g model EmployeeETO eto_type:string

rails g model Employee employee_number:string employee_status:string first_name:string middle_name:string last_name:
string address1:string address2:string city:string region_state:string phone_number:string employee_department:
references hire_date:datetime termination:datetime termination_reason:string payroll_schedule:references
payroll_federal_filing_status:references ledger_account:references payroll_federal_withholding_allowance:references
payroll_federal_withholding_amount:float personal_time_balance:float vacation_time_balance:float sick_leave_balance:
float compensation_increase_date:datetime next_compensation_increase_date:datetime marital_tax_status:string notes:text

add_reference(:products, :supplier, foreign_key: { to_table: :firms }) t.references :expense_ledger_account, null:
false, foreign_key: true, foreign_key: { to_table: :ledger_account })

bin/super-scaffold crud Employee Team employee_number:text_field employee_status:text_field first_name:text_field
middle_name:text_field last_name:text_field address1:text_field address2:text_field city:text_field region_state:
text_field phone_number:text_field employee_department:super_select{class_name=EmployeeDepartment} hire_date:date_field
termination:date_field payroll_schedule:super_select{class_name=PayrollSchedule} payroll_federal_filing_status:
super_select{class_name=PayrollFederalFilingStatus} expense_ledger_account:super_select{class_name=LedgerAccount}
payroll_federal_withholding_allowance:super_select{class_name=PayrollFederalWithholdingAllowance}
payroll_federal_withholding_amount:text_field personal_time_balance:text_field vacation_time_balance:text_field
sick_leave_balance:text_field compensation_increase_date:date_field next_compensation_increase_date:date_field
marital_tax_status:text_field notes:trix_editor

rails g migration AddFieldsToEmployees email:string ssn:string zip_code:string tax_federal_exemptions:string
tax_region_state:string tax_region_state_exemptions:string tax_filing_status:integer tax_other_income:float
tax_deductions:float tax_extra_withholdings:float tax_dependants:integer

rails g migration AddEEOReportingToEmployee eeo_gender:integer eeo_ethnicity:string eeo_dob:date eeo_job_category:
integer z