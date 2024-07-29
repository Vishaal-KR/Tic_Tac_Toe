import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<Homepage> {
  List<String> _board = ['', '', '', '', '', '', '', '', ''];
  String _turn = 'X';
  bool _gameOver = false;
  String _winner = '';

  void _makeMove(int index) {
    if (_board[index] == '' && !_gameOver) {
      setState(() {
        _board[index] = _turn;
        if (_checkWin()) {
          _gameOver = true;
          _winner = _turn;
        } else {
          _turn = _turn == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  bool _checkWin() {
    // Check rows
    for (int i = 0; i < 3; i++) {
      if (_board[i * 3] == _board[i * 3 + 1] &&
          _board[i * 3 + 1] == _board[i * 3 + 2] &&
          _board[i * 3] != '') {
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (_board[i] == _board[i + 3] &&
          _board[i + 3] == _board[i + 6] &&
          _board[i] != '') {
        return true;
      }
    }

    // Check diagonals
    if (_board[0] == _board[4] && _board[4] == _board[8] && _board[0] != '') {
      return true;
    }
    if (_board[2] == _board[4] && _board[4] == _board[6] && _board[2] != '') {
      return true;
    }

    return false;
  }

  void _resetGame() {
    setState(() {
      _board = ['', '', '', '', '', '', '', '', ''];
      _turn = 'X';
      _gameOver = false;
      _winner = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tic Tac Toe',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _gameOver
                  ? _winner == 'X'
                      ? 'X wins!'
                      : 'O wins!'
                  : 'Turn: $_turn',
              style: TextStyle(fontSize: 24),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              shrinkWrap: true,
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _makeMove(index),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Text(
                        _board[index],
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetGame,
              child: Text('Reset Game'),
            ),
          ],
        ),
      ),
    );
  }
}
