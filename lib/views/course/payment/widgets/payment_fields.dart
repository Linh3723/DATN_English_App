import 'package:flutter/material.dart';

class PaymentFields extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController cardNumberController;
  final TextEditingController expiryController;
  final TextEditingController cvvController;
  final TextEditingController nameController;
  final TextStyle errorStyle;

  const PaymentFields({
    super.key,
    required this.formKey,
    required this.cardNumberController,
    required this.expiryController,
    required this.cvvController,
    required this.nameController,
    required this.errorStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Phương thức thanh toán',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildCardNumberField(),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildExpiryField()),
              const SizedBox(width: 16),
              Expanded(child: _buildcvvField()),
            ],
          ),
          const SizedBox(height: 16),
          _buildNameField(),
        ],
      ),
    );
  }

  Widget _buildCardNumberField() {
    return TextFormField(
      controller: cardNumberController,
      keyboardType: TextInputType.number,
      decoration: _buildInputDecoration(
        label: 'Số thẻ',
        hint: '1234 5678 9876 5432',
        icon: Icons.credit_card,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Hãy nhập số thẻ của bạn';
        }
        if (value.length < 16) {
          return 'Số không hợp lệ';
        }
        return null;
      },
      maxLength: 16,
      buildCounter:
          (
            context, {
            required currentLength,
            required isFocused,
            required maxLength,
          }) => null,
    );
  }

  Widget _buildExpiryField() {
    return TextFormField(
      controller: expiryController,
      keyboardType: TextInputType.datetime,
      decoration: _buildInputDecoration(
        label: 'Ngày hết hạn',
        hint: 'MM/YY',
        icon: Icons.calendar_today,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Hãy nhập ngày hết hạn thẻ của bạn';
        }
        if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
          return 'Sử dụng định dạng MM/YY';
        }
        return null;
      },
      maxLength: 5,
      buildCounter:
          (
            context, {
            required currentLength,
            required isFocused,
            required maxLength,
          }) => null,
      onChanged: (value) {
        if (value.length == 2 && !value.contains('/')) {
          expiryController.text = '$value/';
          expiryController.selection = TextSelection.fromPosition(
            TextPosition(offset: expiryController.text.length),
          );
        }
      },
    );
  }

  Widget _buildcvvField() {
    return TextFormField(
      controller: cvvController,
      keyboardType: TextInputType.number,
      obscureText: true,
      decoration: _buildInputDecoration(
        label: 'CVV',
        hint: '123',
        icon: Icons.security,
      ),
      validator: (value){
        if(value == null || value.isEmpty){
          return 'Hãy nhập CVV';
        }
        if (value.length < 3){
          return 'CVV không hợp lệ';
        }
        return null;
      },
      maxLength: 3,
      buildCounter: (context, {
        required currentLength,
        required isFocused,
        required maxLength,
      }) => null,
    );
  }

  Widget _buildNameField(){
    return TextFormField(
      controller: nameController,
      textCapitalization: TextCapitalization.words,
      decoration: _buildInputDecoration(
        label: 'Tên chủ thẻ',
        hint: 'Nguyễn Văn A',
        icon: Icons.person_outline,
      ),
      validator: (value){
        if(value == null || value.isEmpty){
          return 'Hãy nhập tên chủ thẻ';
        }
        if (value.split(' ').length < 2){
          return 'Hãy nhập đầy đủ họ tên';
        }
        return null;
      },
    );
  }
  InputDecoration _buildInputDecoration({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      errorStyle: errorStyle,
    );
  }
}
