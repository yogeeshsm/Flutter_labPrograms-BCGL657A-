
import 'package:flutter/material.dart';
void main() => runApp(ExpenseApp()); 
class ExpenseApp extends StatelessWidget { 
@override 
Widget build(BuildContext context) { 
return MaterialApp( 
home: ExpenseHome(), 
); 
} 
} 
class ExpenseHome extends StatefulWidget { 
@override 
State<ExpenseHome> createState() => _ExpenseHomeState(); 
} 
class _ExpenseHomeState extends State<ExpenseHome> { 
final List<Map<String, dynamic>> _expenses = []; 
final _nameController = TextEditingController(); 
final _amountController = TextEditingController(); 
double get _total { 
return _expenses.fold(0.0, (sum, item) => sum + item['amount']); 
} 
void _addExpense() { 
final name = _nameController.text; 
    final amount = double.tryParse(_amountController.text); 
    if (name.isEmpty || amount == null) return; 
    setState(() { 
      _expenses.add({'name': name, 'amount': amount}); 
    }); 
    _nameController.clear(); 
    _amountController.clear(); 
    Navigator.of(context).pop(); 
  } 
 
  void _showAddDialog() { 
    showDialog( 
      context: context, 
      builder: (_) => AlertDialog( 
        title: Text('Add Expense'), 
        content: Column( 
          mainAxisSize: MainAxisSize.min, 
          children: [ 
            TextField( 
              controller: _nameController, 
              decoration: InputDecoration(labelText: 'Expense Name'), 
            ), 
            TextField( 
              controller: _amountController, 
              decoration: InputDecoration(labelText: 'Amount'), 
              keyboardType: TextInputType.number, 
            ), 
          ], 
        ), 
        actions: [ 
          TextButton(onPressed: Navigator.of(context).pop, child: Text('Cancel')), 
          ElevatedButton(onPressed: _addExpense, child: Text('Add')), 
        ], 
      ), 
    ); 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: Text('Simple Expense Tracker')), 
      body: Column( 
        children: [ 
          Padding( 
            padding: EdgeInsets.all(16), 
            child: Text('Total: \$${_total.toStringAsFixed(2)}', style: TextStyle(fontSize: 20)), 
          ), 
          Expanded( 
            child: ListView.builder( 
              itemCount: _expenses.length, 
              itemBuilder: (_, i) => ListTile( 
                title: Text(_expenses[i]['name']), 
                trailing: Text('\$${_expenses[i]['amount'].toStringAsFixed(2)}'), 
              ), 
            ), 
          ), 
        ], 
      ), 
floatingActionButton: FloatingActionButton( 
onPressed: _showAddDialog, 
child: Icon(Icons.add), 
), 
); 
} 
}
