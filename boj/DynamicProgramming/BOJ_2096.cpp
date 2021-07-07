/*
 백준 2096 내려가기
 21.07.07
 https://github.com/skyqnaqna/algorithm_study/
*/

#include <bits/stdc++.h>

#define INF 2147000000
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int n;
int graph[100000][3];
int dp_max[2][3];
int dp_min[2][3];

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < 3; ++j) {
            cin >> graph[i][j];
        }
    }

    dp_min[0][0] = dp_max[0][0] = graph[0][0], 
    dp_min[0][1] = dp_max[0][1] = graph[0][1], 
    dp_min[0][2] = dp_max[0][2] = graph[0][2];

    for (int i = 1; i < n; ++i) {
        dp_max[i % 2][0] = max(dp_max[(i+1)%2][0], dp_max[(i+1)%2][1]) + graph[i][0];
        dp_max[i % 2][1] = max(max(dp_max[(i+1)%2][0], dp_max[(i+1)%2][1]), dp_max[(i+1)%2][2]) + graph[i][1];
        dp_max[i % 2][2] = max(dp_max[(i+1)%2][1], dp_max[(i+1)%2][2]) + graph[i][2];

        dp_min[i % 2][0] = min(dp_min[(i+1)%2][0], dp_min[(i+1)%2][1]) + graph[i][0];
        dp_min[i % 2][1] = min(min(dp_min[(i+1)%2][0], dp_min[(i+1)%2][1]), dp_min[(i+1)%2][2]) + graph[i][1];
        dp_min[i % 2][2] = min(dp_min[(i+1)%2][1], dp_min[(i+1)%2][2]) + graph[i][2];
    }

    cout << max(dp_max[(n-1)%2][0], max(dp_max[(n-1)%2][1], dp_max[(n-1)%2][2])) << " " << min(dp_min[(n-1)%2][0], min(dp_min[(n-1)%2][1], dp_min[(n-1)%2][2])) << endl;

    return 0;
}