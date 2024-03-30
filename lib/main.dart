import 'package:flutter/material.dart';

void main() => runApp(const ListViewExampleApp());

class ListViewExampleApp extends StatelessWidget {
  const ListViewExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListTileSelectExample(),
    );
  }
}

class ListTileSelectExample extends StatefulWidget {
  const ListTileSelectExample({Key? key}) : super(key: key);

  @override
  ListTileSelectExampleState createState() => ListTileSelectExampleState();
}

class ListTileSelectExampleState extends State<ListTileSelectExample> {
  bool isSelectionMode = false;
  final int listLength = 7;
  late List<bool> _selected;
  bool _selectAll = false;
  bool _isGridMode = false;

  @override
  void initState() {
    super.initState();
    initializeSelection();
  }

  void initializeSelection() {
    _selected = List<bool>.generate(listLength, (_) => false);
  }

  @override
  void dispose() {
    _selected.clear();
    super.dispose();
  }
final List<String> _list = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListTile selection'),
        leading: isSelectionMode
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    isSelectionMode = false;
                  });
                  initializeSelection();
                },
              )
            : const SizedBox(),
        actions: <Widget>[
          if (_isGridMode)
            IconButton(
              icon: const Icon(Icons.grid_on),
              onPressed: () {
                setState(() {
                  _isGridMode = false;
                });
              },
            )
          else
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                setState(() {
                  _isGridMode = true;
                });
              },
            ),
          if (isSelectionMode)
            TextButton(
              child: !_selectAll
                  ? const Text(
                      'select all',
                      style: TextStyle(color: Colors.white),
                    )
                  : const Text(
                      'unselect all',
                      style: TextStyle(color: Colors.white),
                    ),
              onPressed: () {
                _selectAll = !_selectAll;
                setState(() {
                  _selected = List<bool>.generate(listLength, (_) => _selectAll);
                });
              },
            ),
        ],
      ),
      body: _isGridMode
          ? GridBuilder(
              isSelectionMode: isSelectionMode,
              selectedList: _selected,
              onSelectionChange: (bool x) {
                setState(() {
                  isSelectionMode = x;
                });
              },
            )
          : ListBuilder(
              isSelectionMode: isSelectionMode,
              selectedList: _selected,
              onSelectionChange: (bool x) {
                setState(() {
                  isSelectionMode = x;
                });
              },
            ),
    );
  }
}

class GridBuilder extends StatefulWidget {
  const GridBuilder({
    required this.selectedList,
    required this.isSelectionMode,
    required this.onSelectionChange,
  });

  final bool isSelectionMode;
  final ValueChanged<bool>? onSelectionChange;
  final List<bool> selectedList;

  @override
  GridBuilderState createState() => GridBuilderState();
}

class GridBuilderState extends State<GridBuilder> {
  void _toggle(int index) {
    if (widget.isSelectionMode) {
      setState(() {
        widget.selectedList[index] = !widget.selectedList[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.selectedList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (_, int index) {
        return InkWell(
          onTap: () => _toggle(index),
          onLongPress: () {
            if (!widget.isSelectionMode) {
              setState(() {
                widget.selectedList[index] = true;
              });
              widget.onSelectionChange!(true);
            }
          },
          child: GridTile(
            child: Container(
              child: widget.isSelectionMode
                  ? Checkbox(
                      onChanged: (bool? x) => _toggle(index),
                      value: widget.selectedList[index],
                    )
                  : const Icon(Icons.image),
            ),
          ),
        );
      },
    );
  }
}

class ListBuilder extends StatefulWidget {
  const ListBuilder({
    required this.selectedList,
    required this.isSelectionMode,
    required this.onSelectionChange,
  });

  final bool isSelectionMode;
  final List<bool> selectedList;
  final ValueChanged<bool>? onSelectionChange;

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  void _toggle(int index) {
    if (widget.isSelectionMode) {
      setState(() {
        widget.selectedList[index] = !widget.selectedList[index];
      });
    }
  }


String _getItemText(int index) {
  switch (index) {
    case 0:
      return '007\n Tên thiết bị: iphone 15 ProMax\n Hệ Điều Hành iOS 17\n Chip: Apple A17 Pro 6 nhân\n RAM: 8GB\n Dung lượng lưu trữ: 256GB\n Hãng: iPhone(Apple)';
    case 1:
      return '008\n Tên thiết bị: Laptop Apple MacBook Air 13\n Hệ Điều Hành: Android 13\n Card màn hình: Card tích hợp, 8 nhân GPU\n RAM: 16GB\n Ổ cứng: 256 GB SSD';
    case 2:
      return '009\n Tên thiết bị: Samsung Galaxy Z Fold5\n Hệ Điều Hành: iOS 17\n Chip: Snapdragon 8 Gen 2 for Galaxy\n RAM: 12 GB\n Dung lượng: 512GB\n Hãng: SamSung';
    case 3:
      return '0010\n Tên thiết bị: OPPO A78\n Hệ Điều Hành Android 13\n Chip: Snapdragon 680\n RAM: 8GB\n Dung lượng: 256GB\n Hãng: Oppo';
    case 4:
      return '0011\n Tên thiết bị: Porco\n Hệ Điều Hành: Android 13\n Chip: MediaTek Helio G36 8 nhân\n RAM: 3GB\n Dung lượng: 64GB\n Hãng: Xiaomi';
    case 5:
      return '0012\n Tên thiết bị: Realme C67\n Hệ Điều Hành Android 14\n Chip: Snapdragon 685 8 nhân\n RAM: 8GB\n Dung lượng: 256GB\n Hãng: Realme';
    case 6:
      return '0013\n Tên thiết bị: Lenovo Tab M8\n Hệ Điều Hành Android 12 (Go Edition)\n Chip: MediaTek Helio A22\n RAM: 3GB\n Dung lượng: 32GB\n Hãng: Lenovo';
    default:
      return index.toString();
  }
}


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.selectedList.length,
      itemBuilder: (_, int index) {
        return ListTile(
          onTap: () => _toggle(index),
          onLongPress: () {
            if (!widget.isSelectionMode) {
              setState(() {
                widget.selectedList[index] = true;
              });
              widget.onSelectionChange!(true);
            }
          },
          trailing: widget.isSelectionMode
              ? Checkbox(
                  value: widget.selectedList[index],
                  onChanged: (bool? x) => _toggle(index),
                )
              : const SizedBox.shrink(),
          title: Column(
            children: [
              Text ('\n id: ${_getItemText(index)}'),
            ],
          ),
        );
      },
    );
  }
}
