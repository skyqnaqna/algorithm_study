/*----------------------
|프로그래머스 타겟 넘버
|21.01.26
----------------------*/

#include <string>
#include <vector>

using namespace std;

int DFS(int idx, vector<int> &num, int sum, int &target)
{
    if (idx == num.size())
    {
        if (sum == target) return 1;
        else return 0;
    }

    return DFS(idx+1, num, sum+num[idx], target) + DFS(idx+1, num, sum-num[idx], target);
}
int solution(vector<int> numbers, int target) 
{
    int answer = DFS(0, numbers, 0, target);

    return answer;
}
