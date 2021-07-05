/*
 백준 9663 N-Queen
 21.07.05
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

int n;
bool column[15];
bool diagonal1[30];
bool diagonal2[30];
int answer = 0;

void backtracking(int row) {
    if (row == n) {
        answer++;
    } else {
        for (int i = 0; i < n; ++i) {
            if (!column[i] && !diagonal1[row + i] && !diagonal2[row - i + n - 1]) {
                column[i] = true;
                diagonal1[row + i] = true;
                diagonal2[row - i + n - 1] = true;
                backtracking(row + 1);
                column[i] = false;
                diagonal1[row + i] = false;
                diagonal2[row - i + n - 1] = false;
            }
        }
    }
}

int main() {
    cin >> n;

    backtracking(0);

    cout << answer << endl;

    return 0;
}