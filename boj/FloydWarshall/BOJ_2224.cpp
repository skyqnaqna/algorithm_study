// 백준 2224 명제 증명
// 21.02.26
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

bool graph[58][58];

int main()
{
    ios_base::sync_with_stdio(false); cin.tie(nullptr); cout.tie(nullptr);
    int n; cin >> n;

    fill(&graph[0][0], &graph[57][58], false);
    int cnt = 0;

    for (int i = 0; i < n; ++i)
    {
        string a, x, b; cin >> a >> x >> b;
        int u, v;
        u = a[0] - 'A'; v = b[0] - 'A';
        graph[u][v] = true;
    }

    for (int k = 0; k < 58; ++k)
    {
        for (int i = 0; i < 58; ++i)
        {
            for (int j = 0; j < 58; ++j)
            {
                if (graph[i][k] && graph[k][j]) graph[i][j] = true;
            }
        }
    }

    for (int i = 0; i < 58; ++i)
    {
        for (int j = 0; j < 58; ++j)
        {
            if (i == j) continue;
            if (graph[i][j]) ++cnt;
        }
    }

    cout << cnt << endl;

    for (int i = 0; i < 58; ++i)
    {
        for (int j = 0; j < 58; ++j)
        {
            if (i == j) continue;
            if (graph[i][j]) cout << char(i + 'A') << " => " << char(j + 'A') << endl;
        }
    }

    return 0;
}