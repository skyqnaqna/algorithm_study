/*
 백준 1074 Z
 21.08.02
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF 2e9
#define endl "\n"

int n, r, c;

int recursion(int N, int row, int col) {
    if (N == 0) return 0;

    int half = 1<<(N-1);
    if (row < half && col < half) return recursion(N-1, row, col);
    if (row < half && col >= half) return half * half + recursion(N-1, row, col - half);
    if (row >= half && col < half) return 2 * half * half + recursion(N-1, row - half, col);
    else return 3 * half * half + recursion(N-1, row - half, col - half);
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> r >> c;

    cout << recursion(1<<n, r, c) << endl;

    return 0;
}
