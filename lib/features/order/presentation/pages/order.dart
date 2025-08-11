import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../cart/presentation/widgets/CustomCart.dart';
import '../cubit/order_cubit.dart';
import '../widgets/CustomOrder.dart';

class Order extends StatelessWidget {
  final String name;
  final String image;
  final List<Map<String, dynamic>> types;

  const Order({
    super.key,
    required this.name,
    required this.image,
    required this.types,
    required int price,  // مش مستخدم بس خليته عشان ماتبطل تجيه اخطاء لو انت مستخدمه برضو
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrderCubit(
        name: name,
        image: image,
        types: types,
      ),
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          final cubit = context.read<OrderCubit>();

          // عرض الأنواع الفرعية مباشرة إذا موجودة (مجمعه من كل الأنواع الرئيسية)
          final List<String> subTypes = cubit.allSubTypes;

          // لو فيه أنوع فرعية موجودة نعرضها، غير هيك نعرض الأنواع الرئيسية
          final bool hasSubTypes = subTypes.isNotEmpty;

          // قائمة الأنواع التي سيتم عرضها
          final typesToShow = hasSubTypes ? subTypes : state.types.map((e) => e['name'].toString()).toList();

          // التحديد الحالي سواء في الأنواع الفرعية أو الرئيسية
          final selectedTypeToShow = hasSubTypes ? state.selectedSubType : state.selectedType;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomOrder(
              name: state.name,
              image: state.image,
              type: typesToShow,
              selectedType: selectedTypeToShow,
              quantity: state.quantity,
              totalPrice: state.totalPrice,
              unitPrice: state.unitPrice,
              isSupportedAdded: state.isSupportedAdded,
              onIncrease: cubit.increase,
              onDecrease: cubit.decrease,
              // نختار الدالة حسب ما إذا كانت الأنواع فرعية معروضة أو رئيسية
              onSelectType: hasSubTypes ? cubit.selectSubType : cubit.selectType,
              onToggleSupport: cubit.toggleSupport,
              onAddToCart: () {
                if (!state.isAvailable) return;

                final cart = context.read<CartCubit>();
                cart.addItem(CartItem(
                  name: state.name,
                  type: selectedTypeToShow ?? '',
                  image: state.image,
                  quantity: state.quantity,
                  unitPrice: state.unitPrice + (state.isSupportedAdded ? 30 : 0),
                ));

                Navigator.of(context).pop();
              },
              isAvailable: state.isAvailable,
              // لازم تمرر subTypes علشان يظهروا تحت "أنواع اللحمة" في CustomOrder لو حبيت تضيفها هناك
              subTypes: subTypes,
              selectedSubType: state.selectedSubType,
              onSelectSubType: cubit.selectSubType,
            ),
          );
        },
      ),
    );
  }
}
