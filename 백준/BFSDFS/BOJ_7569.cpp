/*----------------------
|백준 7569 토마토
|21.01.27
----------------------*/

#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>

using namespace std;

int n, m, h;
vector <vector <vector <int> > > graph;
// 상, 하, 좌, 우, 윗상, 아랫상자
int dx[6] = {0, 0, -1, 1, 0, 0};
int dy[6] = {-1, 1, 0, 0, 0, 0};
int dz[6] = {0, 0, 0, 0, 1, -1};

int main()
{
    scanf("%d %d %d", &m, &n, &h);
    graph.resize(h);

    int remains = 0; // 익지 않은 토마토의 개수
    queue <pair <int, pair< int, int> > > tomatoes; // 익은 토마토들 위치 넣을거임

    for (int i = 0; i < h; ++i)
    {
        for (int j = 0; j < n; ++j)
        {
            vector <int> v;
            for (int k = 0; k < m; ++k)
            {
                int temp; scanf("%d", &temp);
                v.push_back(temp);
                if (temp == 0) ++remains;
                else if (temp == 1)
                    tomatoes.push({i, {j, k}});
            }
            graph[i].push_back(v);
        }
    }

    int days = 1;

    while(!tomatoes.empty())
    {
        int z = tomatoes.front().first; // 높이
        int r = tomatoes.front().second.first; // 행(세로)
        int c = tomatoes.front().second.second; // 열(가로)
        tomatoes.pop();

        int day = graph[z][r][c];

        for (int i = 0; i < 6; ++i)
        {
            int nz = z + dz[i];
            int nr = r + dy[i];
            int nc = c + dx[i];

            if (nz < 0 || nz >= h || nr < 0 || nr >= n || nc < 0 || nc >= m) continue;

            if (graph[nz][nr][nc] == 0) // 안익은거 찾아서 쳐넣기(곧 익을 맛토)
            {
                tomatoes.push({nz, {nr, nc}});
                graph[nz][nr][nc] = day + 1;
                --remains;

                if (days < day + 1) days = day + 1;
            }
        }
    }

    if (remains) printf("%d\n", -1);
    else printf("%d\n", days - 1);

    return 0;
}