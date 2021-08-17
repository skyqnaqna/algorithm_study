/*
 백준 17829 222-풀링
 21.08.17
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

const int MAX = 1024;

int n, graph[MAX][MAX];

// 좌상단을 각 정사각형의 시작점으로 두고 2번째로 큰 수를 찾아서 시작점에 저장
void pooling(int r, int c, int size) {
    int preSize = size / 2;
    vector <int> nums = {graph[r][c], graph[r][c + preSize], graph[r + preSize][c], graph[r + preSize][c + preSize]};
    sort(nums.begin(), nums.end());

    graph[r][c] = nums[2];
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n;

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            cin >> graph[i][j];
        }
    }


    for (int size = 2; size <= n; size <<= 1) {
        for (int i = 0; i <= n - size; i += size) {
            for (int j = 0; j <= n - size; j += size) {
                pooling(i, j, size);
            }
        }
    }

    cout << graph[0][0] << endl;

    return 0;
}