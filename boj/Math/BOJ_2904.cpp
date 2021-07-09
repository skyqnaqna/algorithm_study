/*
 백준 2904 수학은 너무 쉬워
 21.07.09
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

bool notPrime[1000001];
int n, a[100];
vector <int> prime;
int cnt[100][80000]; // 대략 100만 이하 소수가 7xxxx개 있음
int totalCnt[80000]; // 전체 숫자에서 소수가 나타난 횟수
int gcdCnt[80000]; // gcd가 될 것 같은 횟수
int ans1, ans2; // 가장 큰 점수, 최소 횟수

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    for (int i = 2; i <= 1000000; ++i) {
        if (notPrime[i]) continue;

        for (int j = 2 * i; j <= 1000000; j += i) {
            notPrime[j] = true;
        }
    }

    for (int i = 2; i <= 1000000; ++i) {
        if (!notPrime[i]) {
            prime.push_back(i);
        }
    }

    cin >> n;
    for (int i = 0; i < n; ++i) {
        cin >> a[i];
    }

    // 각 숫자별로 소수의 개수 구하기 => 소인수분해
    for (int i = 0; i < n; ++i) {
        int num = a[i];
        for (int j = 0; j < prime.size(); ++j) {
            while (num % prime[j] == 0) {
                totalCnt[j]++;
                cnt[i][j]++;
                num /= prime[j];
            }
        }
    }

//    for (int i = 0; i < n; ++i) {
//        cout << a[i] << " : ";
//        for (int j = 0; j < prime.size(); ++j) {
//            if (cnt[i][j] != 0) {
//                cout << "prime " << prime[j] << " " << cnt[i][j] << " ";
//            }
//        }
//        cout << endl;
//    }

    for (int i = 0; i < prime.size(); ++i) {
        gcdCnt[i] = totalCnt[i] / n;
    }

    ans1 = 1;
    for (int i = 0; i < prime.size(); ++i) {
        for (int j = 0; j < gcdCnt[i]; ++j) {
            ans1 *= prime[i];
        }
        // 각 숫자들에 대해서 GCD되기 위해서 소수가 얼마나 부족한지 확인
        for (int j = 0; j < n; ++j) {
            // 부족할 때
            if (cnt[j][i] < gcdCnt[i]) {
                ans2 += gcdCnt[i] - cnt[j][i];
            }
        }
    }

    cout << ans1 << " " << ans2 << endl;

    return 0;
}
