/*
 백준 1256 사전
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

int n, m;
int k, cache[101][101];
char ans[201];

int solution(int a, int z) {
    // a == 0 || z == 0
    if (a * z == 0) {
        return 1;
    } else if (cache[a][z] > 0) {
        return cache[a][z];
    }

    cache[a][z] = solution(a - 1, z) + solution(a, z - 1);
    if (cache[a][z] >= INF) {
        cache[a][z] = INF;
    }
    return cache[a][z];
}


int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n >> m >> k;

    if (solution(n, m) < k) {
        cout << -1 << endl;
        return 0;
    }

    // 가장 앞에 있는 문자열부터 채워 나간다
    int cntA = n, cntZ = m; // 앞으로 사용할 수 있는 문자
    for (int i = 0; i < n + m; ++i) {
        // i번째 문자열이 a라면
        if (cntA > 0) {
            int tmp = solution(cntA - 1, cntZ);
            // tmp가 k보다 작으니까 a 말고 z로 시작하는 걸로 넘어가야함
            if (tmp < k) {
                ans[i] = 'z';
                k -= tmp;
                --cntZ;
            } else {
                ans[i] = 'a';
                --cntA;
            }
        } else {
            ans[i] = 'z';
            --cntZ;
        }
        cout << ans[i];
    }

    return 0;
}
