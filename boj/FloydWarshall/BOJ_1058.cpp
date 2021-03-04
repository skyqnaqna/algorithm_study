// 백준 1058 친구
// 21.02.27
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#include <stack>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

// A와 B가 찐친이거나 친구의 친구인 관계여야함. 한 다리 이상만 되고 2다리 이상 건너 아는 친구는 세면 안됨
int main()
{
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);
    cout.tie(nullptr);
    int n;
    cin >> n;
    vector<vector<int> > graph(n, vector<int>(n, INF));

    for (int i = 0; i < n; ++i)
    {
        string s;
        cin >> s;
        for (int j = 0; j < n; ++j)
        {
            if (s[j] == 'Y') graph[i][j] = 1;
        }
    }

    for (int k = 0; k < n; ++k)
    {
        for (int i = 0; i < n; ++i)
        {
            for (int j = 0; j < n; ++j)
            {
                if (i == j || i == k || j == k) continue;
                graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j]);
            }
        }
    }

    int ans = 0;
    for (int i = 0; i < n; ++i)
    {
        int cnt = 0;
        for (int j = 0; j < n; ++j)
        {
            if (graph[i][j] < INF && graph[i][j] <= 2) ++cnt;
        }
        ans = max(ans, cnt);
    }

    printf("%d\n", ans);

    return 0;
}