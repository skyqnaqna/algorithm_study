// 백준 17472 다리 만들기 2
// 21.03.16
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#include <stack>
#include <tuple>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int graph[10][10];
int parent[10];
bool visited[10][10] = {false};
int dx[4] = {0, 0, -1, 1};
int dy[4] = {-1, 1, 0, 0};

int find(int a)
{
    if (parent[a] == a) return a;
    else return parent[a] = find(parent[a]);
}

void _union(int a, int b)
{
    int x = find(a);
    int y = find(b);

    if (x < y) parent[y] = x;
    else parent[x] = y;
}

int main()
{
    int n, m; scanf("%d %d", &n, &m);

    for (int i = 0; i < n; ++i)
    {
        for (int j = 0; j < m; ++j)
        {
            scanf("%d", &graph[i][j]);
        }
    }

    // 섬 번호 매기기
    int land = 1;
    for (int i = 0; i < n; ++i)
    {
        for (int j = 0; j < m; ++j)
        {
            if (graph[i][j] && !visited[i][j])
            {
                queue <pii> q;
                q.push({i, j});
                while (!q.empty())
                {
                    int r = q.front().first;
                    int c = q.front().second;
                    q.pop();
                    visited[r][c] = true;
                    graph[r][c] = land;

                    for (int i = 0; i < 4; ++i)
                    {
                        int nr = r + dy[i];
                        int nc = c + dx[i];

                        if (nr < 0 || nc < 0 || nr >= n || nc >= m) continue;
                        if (graph[nr][nc] && !visited[nr][nc]) q.push({nr, nc});
                    }
                }
                ++land;
            }
        }
    }

    // 예비 다리 구하기
    priority_queue<tuple<int, int, int>, vector<tuple<int, int, int>>, greater<> > edges;
    for (int i = 0; i < n; ++i)
    {
        for (int j = 0; j < m; ++j)
        {
            // 가로 다리 구하기
            if (j-1 >= 0 && graph[i][j-1] && graph[i][j] == 0)
            {
                int pre = graph[i][j-1];
                int nx = j + 1;
                int cost = 1;
                while (nx < m)
                {
                    if (graph[i][nx] == 0) ++cost;
                    else break;
                    ++nx;
                }
                if (nx < m && graph[i][nx] && graph[i][nx] != pre && cost > 1)
                    edges.push({cost, pre, graph[i][nx]});
            }

            // 세로 다리 구하기
            if (i-1 >= 0 && graph[i-1][j] && graph[i][j] == 0)
            {
                int pre = graph[i-1][j];
                int ny = i + 1;
                int cost = 1;
                while (ny < n)
                {
                    if (graph[ny][j] == 0) ++cost;
                    else break;
                    ++ny;
                }
                if (ny < n && graph[ny][j] && graph[ny][j] != pre && cost > 1)
                    edges.push({cost, pre, graph[ny][j]});
            }
        }
    }

    // 크루스칼로 섬 연결하기
    for (int i = 1; i < land; ++i) parent[i] = i;

    int cnt = 0, ans = 0;
    while (!edges.empty())
    {
        int w, u, v;
        tie(w, u, v) = edges.top(); edges.pop();

        if (find(u) != find(v))
        {
            _union(u, v);
            ans += w;
            ++cnt;
        }
    }

    if (cnt < land - 2) printf("%d\n", -1);
    else printf("%d\n", ans);

    return 0;
}