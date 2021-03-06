#include "router.h"
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <vector>
#include <arpa/inet.h>
#include <iomanip>
#include <iostream>

using namespace std;


class MyRT{
  public:
    MyRT(RoutingTableEntry* entry){
      this->addr = ntohl(entry->addr);
      this->len = entry->len;
      this->if_index = entry->if_index;
      this->nexthop = entry->nexthop;
    }
    uint32_t addr; // 大端序，IPv4 地址
    uint32_t len; // 小端序，前缀长度
    uint32_t if_index; // 小端序，出端口编号
    uint32_t nexthop; // 大端序，下一跳的 IPv4 地址
};

struct RT
{
  MyRT* re;
  RT* next = NULL;
};


RT* Mstart = NULL;

/*
  RoutingTable Entry 的定义如下：
  typedef struct {
    uint32_t addr; // 大端序，IPv4 地址
    uint32_t len; // 小端序，前缀长度
    uint32_t if_index; // 小端序，出端口编号
    uint32_t nexthop; // 大端序，下一跳的 IPv4 地址
  } RoutingTableEntry;

  约定 addr 和 nexthop 以 **大端序** 存储。
  这意味着 1.2.3.4 对应 0x04030201 而不是 0x01020304。
  保证 addr 仅最低 len 位可能出现非零。
  当 nexthop 为零时这是一条直连路由。
  你可以在全局变量中把路由表以一定的数据结构格式保存下来。
*/

/**
 * @brief 插入/删除一条路由表表项
 * @param insert 如果要插入则为 true ，要删除则为 false
 * @param entry 要插入/删除的表项
 * 
 * 插入时如果已经存在一条 addr 和 len 都相同的表项，则替换掉原有的。
 * 删除时按照 addr 和 len 匹配。
 */
void update(bool insert, RoutingTableEntry entry) {
  if(Mstart == NULL){
    if(insert){
      Mstart = new RT();
      Mstart->re = new MyRT(&entry);
      return;
    }else{
      return;
    }
  }

  if(insert){
    RT* point = Mstart;
    while(point != NULL){
      if(point->re->len != entry.len || point->re->addr != ntohl(entry.addr)){
        if(point->next == NULL){
          point->next = new RT();
          point->next->re = new MyRT(&entry);
          // cout << "j\n";
          return;
        }else{
          point = point->next;
        }
      }else{
        point->re = new MyRT(&entry);
        return;
      }
    }
  }else{
    RT* point = Mstart;
    if(point != NULL){
      if(point->re->len == entry.len && point->re->addr == ntohl(entry.addr)){
        Mstart = point->next;
        return;
      }else{
        while(point->next != NULL){
          if(point->next->re->len == entry.len && point->next->re->addr == ntohl(entry.addr)){
            point->next = point->next->next;
            return;
          }else{
            point = point->next;
          }
        }
      }
    }
  }
}

//uint32_t mask[33]{0xffffffff, 0x7fffffff, 0x3fffffff, 0x1fffffff, 0x0fffffff, 0x07ffffff, 0x03ffffff, 0x01ffffff, 0x00ffffff, 0x007fffff, 0x003fffff, 0x001fffff, 0x000fffff, 0x0007ffff, 0x0003ffff, 0x0001ffff, 0x0000ffff, 0x00007fff, 0x00003fff, 0x00001fff, 0x00000fff, 0x000007ff, 0x000003ff, 0x000001ff, 0x000000ff, 0x0000007f, 0x0000003f, 0x0000001f, 0x0000000f, 0x00000007, 0x00000003, 0x00000001};
// uint32_t mask2[32]{0xfffffffe, 0xfffffffd, 0xfffffffb, 0xfffffff7, 0xffffffef, 0xffffffdf, 0xffffffbf, 0xffffff7f, 0xfffffeff, 0xfffffdff, 0xfffffbff, 0xfffff7ff, 0xffffefff, 0xffffdfff, 0xffffbfff, 0xffff7fff, 0xfffeffff, 0xfffdffff, 0xfffbffff, 0xfff7ffff, 0xffefffff, 0xffdfffff, 0xffbfffff, 0xff7fffff, 0xfeffffff, 0xfdffffff, 0xfbffffff, 0xf7ffffff, 0xefffffff, 0xdfffffff, 0xbfffffff, 0x7fffffff};


void print32(string str, uint32_t t){
  cout << str;
  cout << " " << hex << setw(8) << setfill('0') << t << endl;
}
/**
 * @brief 进行一次路由表的查询，按照最长前缀匹配原则
 * @param addr 需要查询的目标地址，大端序
 * @param nexthop 如果查询到目标，把表项的 nexthop 写入
 * @param if_index 如果查询到目标，把表项的 if_index 写入
 * @return 查到则返回 true ，没查到则返回 false
 */
bool query(uint32_t addr, uint32_t *nexthop, uint32_t *if_index) {
  // TODO:
  
  *nexthop = 0;
  *if_index = 0;
  bool find = false;
  
  uint32_t sAddr = ntohl(addr);


  uint32_t max_match_length = 0x00000000;
  RT* max_match_entry = NULL;

  RT* point = Mstart;
  // int i = 0;

  while(point != NULL){
    // i++;
    // print32("addr",point->re->addr);
    // print32("len",point->re->len);
    // long long tmptL = (1 << point->re->len) - 1;
    // cout << setw(8) << setfill('0') << tmptL << endl;
    uint32_t tmpt = point->re->len == 32 ? 0xffffffff : ((1 << point->re->len) - 1);
    
    // print32("tmpt", tmpt);

    // cout << point->re->addr << " " << sAddr << endl;
    // cout << (~(point->re->addr ^ sAddr) >> (32-point->re->len)  ) << endl;

    // print32("answer", ((~(point->re->addr ^ sAddr)) >> (32-point->re->len)));
    
    if( ((~(point->re->addr ^ sAddr)) >> (32-point->re->len)) == tmpt){
      find = true;
      // cout << "i: " << i << endl;
      // cout << point->re->len << endl;
      // cout << (point->re->len > max_match_length) << endl;
      
      if(point->re->len > max_match_length){
        max_match_length = point->re->len;
        max_match_entry = point;
        // cout << "?\n";
        // cout << "max" << max_match_entry << endl;
      }
      // cout << "r" << endl;
    }
    // cout << "1: " << point << endl;
    point = point->next;

//    cout << "2: " << point << endl;
    // if(point == NULL){
      // cout << "yoho";
      // break;
      
    // }
  }

  // cout << "yoho\n";

  if(find){
    *nexthop = max_match_entry->re->nexthop;
    *if_index = max_match_entry->re->if_index;
  }
  return find;
}