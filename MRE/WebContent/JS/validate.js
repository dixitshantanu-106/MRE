$(function()
{
	$.validator.addMethod('strongPassword',function(value,element)
	{
		return this.optional(element)
		|| value.length >= 6
		&& /\d/.test(value);
	},'Your Password must be atleast 6 characters long and must contain one digit\'.');
	$("#Hregister").validate
	(
			{
				rules:
				{
					name:'required',
					addr:'required',
					loc:'required',
					pass:
					{
						required:true,
						strongPassword:true
					},
					cpass:
					{
						required:true,
						equalTo:"#ppass"
					},
					phn:
					{
						required:true,
						maxlength: 10,
						minlength: 10,
						remote: "../HcustomerPhnValidate"
					}
				}
			}
	);
}
);
$(function()
		{
			$.validator.addMethod('strongPassword',function(value,element)
			{
				return this.optional(element)
				|| value.length >= 6
				&& /\d/.test(value);
			},'Your Password must be atleast 6 characters long and must contain one digit\'.');
			$("#Rregister").validate
			(
					{
						rules:
						{
							bname:'required',
							branch:'required',
							ifsc:'required',
							acc:'required',
							name:'required',
							addr:'required',
							pass:
							{
								required:true,
								strongPassword:true
							},
							cpass:
							{
								required:true,
								equalTo:"#pass"
							},
							phn:
							{
								required:true,
								maxlength: 10,
								minlength: 10,
								remote: "../RcustomerPhnValidate"
							}
						}
					}
			);
		}
);
$(function()
		{
			$.validator.addMethod('strongPassword',function(value,element)
			{
				return this.optional(element)
				|| value.length >= 6
				&& /\d/.test(value);
			},'Your Password must be atleast 6 characters long and must contain one digit\'.');
			$("#HcustomerEdit").validate
			(
					{
						rules:
						{
							pass:
							{
								strongPassword:true
							},
							cpass:
							{
								required:true,
								equalTo:"#hpass"
							},
							phn:
							{
								maxlength: 10,
								minlength: 10,
								remote: "../HcustomerPhnValidate"
							}
						}
					}
			);
		}
);