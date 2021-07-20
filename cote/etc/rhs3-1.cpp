/*
 제 3회 류호석배 알고리즘 코딩 테스트
 1번 빌런 호석
 21.07.20
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;

#define INF 2e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef pair<int, int> pii;
typedef pair<ll, ll> pll;
typedef unsigned int ui;

int n, k, p, x, diff[10][10];
ui digit[] = {0b01110111, 0b00100100, 0b01011101, 0b01101101, 0b00101110, 0b01101011,
0b01111011, 0b00100101, 0b01111111, 0b01101111};

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> k >> p >> x;

    for (int i = 0; i < 10; ++i) {
        for (int j = i + 1; j < 10; ++j) {
            ui xorBits = digit[i] ^ digit[j];

            int bitCnt = 0;
            for (int k = 0; k < 7; ++k) {
                if ((xorBits & (1 << k)) != 0) bitCnt++;
            }

            diff[i][j] = diff[j][i] = bitCnt;
        }
    }

    // for (int i = 0; i < 10; ++i) {
    //     for (int j = 0; j < 10; ++j) {
    //         cout << diff[i][j] <<  " ";
    //     }
    //     cout << endl;
    // }

    int ans = 0;

    for (int i = 1; i <= n; ++i) {
        if (i == x) continue;
        int tempI = i, tempX = x, cnt = 0, idx = 0;
        while (idx++ < k) {
            int a = tempX % 10;
            int b = tempI % 10;

            tempX /= 10;
            tempI /= 10;

            cnt += diff[a][b];
            if (cnt > p) break;
        }

        if (cnt <= p) ans++;
    }

    cout << ans << endl;

    return 0;
}
