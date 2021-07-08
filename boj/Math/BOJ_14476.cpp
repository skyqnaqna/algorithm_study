/*
 백준 14476 최대공약수 하나 빼기
 21.07.08
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

const int MAX = 1000002;
int n;
// 왼쪽 오른쪽 끝부분 2칸 추가
int nums[MAX], leftGCD[MAX], rightGCD[MAX];

int gcd(int a, int b) {
    if (b == 0) return a;
    return gcd(b, a % b);
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;

    int who, ans = -1;

    for (int i = 1; i <= n; ++i) cin >> nums[i];

    for (int i = 1; i <= n; ++i) {
        leftGCD[i] = gcd(leftGCD[i - 1], nums[i]);
    }

    for (int i = n; i >= 1; --i) {
        rightGCD[i] = gcd(rightGCD[i + 1], nums[i]);
    }

    for (int i = 1; i <= n; ++i) {
        int curGcd = gcd(leftGCD[i - 1], rightGCD[i + 1]);
        if (nums[i] % curGcd == 0) continue;
        if (ans < curGcd) {
            ans = curGcd;
            who = nums[i];
        }
    }

    if (ans == -1) cout << ans << endl;
    else cout << ans << " " << who << endl;

    return 0;
}
