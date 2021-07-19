/*
 백준 14499 주사위 굴리기
 21.07.19
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;

class Dice {
    int top, bottom, left, right, aboveTop, underTop;
public:
    Dice() {
        top = bottom = left = right = aboveTop = underTop = 0;
    }

    void printTop() {
        cout << this->top << endl;
    }

    void setBottom(int x) {
        this->bottom = x;
    }

    int getBottom() {
        return this->bottom;
    }

    void toEast() {
        int temp = right;
        right = top;
        top = left;
        left = bottom;
        bottom = temp;
    }

    void toWest() {
        int temp = left;
        left = top;
        top = right;
        right = bottom;
        bottom = temp;
    }

    void toNorth() {
        int temp = aboveTop;
        aboveTop = top;
        top = underTop;
        underTop = bottom;
        bottom = temp;
    }

    void toSouth() {
        int temp = bottom;
        bottom = underTop;
        underTop = top;
        top = aboveTop;
        aboveTop = temp;
    }
};

int n, m, x, y, k, graph[20][20];
vector <int> command;
int dy[] = {1, -1, 0, 0};
int dx[] = {0, 0, -1, 1};
Dice dice;

void roll(int direction) {
    int row = x + dx[direction - 1];
    int col = y + dy[direction - 1];

    if (row < 0 || col < 0 || row >= n || col >= m) return;

    if (direction == 1) {
        dice.toEast();
    } else if (direction == 2) {
        dice.toWest();
    } else if (direction == 3) {
        dice.toNorth();
    } else if (direction == 4) {
        dice.toSouth();
    }

    if (graph[row][col] == 0) {
        graph[row][col] = dice.getBottom();
    } else {
        dice.setBottom(graph[row][col]);
        graph[row][col] = 0;
    }

    dice.printTop();
    x = row, y = col;
}


int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> m >> x >> y >> k;

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            cin >> graph[i][j];
        }
    }

    for (int i = 0; i < k; ++i) {
        int c; cin >> c;
        command.push_back(c);
    }

    dice = Dice();

    for (auto &i : command) {
        roll(i);
    }

    return 0;
}