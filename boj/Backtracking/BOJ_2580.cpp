/*
 백준 2580 스도쿠
 21.07.06
 https://github.com/skyqnaqna/algorithm_study/
*/

#include <bits/stdc++.h>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int graph[9][9];
int n;
vector <pii> emptySpace;

bool checkColumn(int row, int col, int num) {
    for (int i = 0; i < 9; ++i) {
        if (i == row || graph[i][col] == 0) continue;
        if (graph[i][col] == num) return false;
    }
    return true;
}

bool checkRow(int row, int col, int num) {
    for (int i = 0; i < 9; ++i) {
        if (i == col || graph[row][i] == 0) continue;
        if (graph[row][i] == num) return false;
    }
    return true;
}

bool checkBox(int row, int col, int num) {
    int r = (row / 3) * 3;
    int c = (col / 3) * 3;

    for (int i = r; i < r + 3; ++i) {
        for (int j = c; j < c + 3; ++j) {
            if (i == row && j == col) continue;
            if (graph[i][j] == 0) continue;
            if (graph[i][j] == num) return false;
        }
    }
    return true;
}

void backtracking(int idx) {
    if (idx == n) {
        for (int i = 0; i < 9; ++i) {
            for (int j = 0; j < 9; ++j) {
                cout << graph[i][j] << " ";
            }
            cout << endl;
        }

        exit(0);
    }

    int r = emptySpace[idx].first;
    int c = emptySpace[idx].second;

    for (int i = 1; i < 10; ++i) {
        graph[r][c] = i;
        if (checkColumn(r, c, i) && checkRow(r, c, i) && checkBox(r, c, i)) {
            backtracking(idx+1);
        }
        graph[r][c] = 0;
    }
}


int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    for (int i = 0; i < 9; ++i) {
        for (int j = 0; j < 9; ++j) {
            cin >> graph[i][j];
            if (graph[i][j] == 0) emptySpace.push_back({i, j});
        }
    }

    n = emptySpace.size();

    backtracking(0);

    return 0;
}