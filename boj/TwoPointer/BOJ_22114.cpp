/*
 백준 22114 창영이와 점프
 21.08.03
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

/*
 * 브루트포스는 N의 범위때문에 안됨
 * 투 포인터를 이용하여 갈수있는 블록은 쭉 진행하다가
 * 점프해야하는 상황이면
 *  1. 점프 가능
 *      점프를 사용해서 넘어가고 Left(시작점)변수를 점프해서 넘어온 곳으로 저장하기
 *  2. 점프 불가능
 *      현재 밟은 블록 수를 ans와 비교하여 저장하고
 *      Right(도착지점)변수를 Left(시작점)로 설정하여 시작하기
 */

int n, k, ans, len[100000];
bool useJump;

int main() {
    ios::sync_with_stdio(0); cin.tie(0);
    freopen("input.txt", "r", stdin);

    cin >> n >> k;

    for (int i = 0; i < n; ++i) {
        cin >> len[i];
    }

    int l = 0, r = 0, cnt = 1;
    while (r < n - 1) {
        if (k < len[r]) {
            if (useJump) {
                ans = max(ans, cnt);
                r = l; // 새로운 시작점으로 이동
                cnt = 1;
                useJump = false;
                continue;
            } else {
                useJump = true;
                l = r + 1; // 점프해서 넘어간 곳은 새로운 시작점으로 저장해두기
            }
        }
        ++r;
        ++cnt;
        ans = max(ans, cnt);
    }

    cout << ans << endl;

    return 0;
}
