﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using TbcTestAppBLL.Enums;
using TbcTestAppBLL.Models;
using TbcTestAppBLL.Validation.ErrorMassages;
using TbcTestAppBLL.Validators;

namespace TbcTestAppBLL.Validation.ValidationAttributes.PersonModelValidationAttributes
{
    [AttributeUsage(AttributeTargets.Property | AttributeTargets.Field, AllowMultiple = false)]
    sealed public class RelationTypeValidationAttribute : ValidationAttribute
    {
        private Type enumTypeForValidation { get;  set; }

        public RelationTypeValidationAttribute(Type enumForValidation)
        {
            enumTypeForValidation = enumForValidation;
        }

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value != null)
            {
                var result = Enum.IsDefined(enumTypeForValidation, value);

                if (!result)
                {
                    return new ValidationResult(ValidationMassages.ReletionTypeIdNotValid);
                }

                return ValidationResult.Success;
            }

            return ValidationResult.Success;
        }
    }
  
}


