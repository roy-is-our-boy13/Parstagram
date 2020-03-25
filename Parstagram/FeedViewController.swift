//
//  FeedViewController.swift
//  Parstagram
//
//  Created by Roy Perlman on 3/17/20.
//  Copyright © 2020 Roy Perlman. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage
import MessageInputBar

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tableView: UITableView!
    let commentBar = MessageInputBar()
    var showsCommentBar = false
    var posts = [PFObject]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .interactive
    }
    
    override var inputAccessoryView: UIView?
    {
        return commentBar
    }
    
    override var canBecomeFirstResponder: Bool
    {
        return showsCommentBar
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Post")
        query.includeKeys(["author","comments","comments.author"])
        query.limit = 20
        
        query.findObjectsInBackground
        {
            (post,error)in
            if post != nil
            {
                self.posts = post!
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let post = posts[section]
        let comments = (post["comments"] as? [PFObject]) ?? []
        return (comments.count + 1)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let post = posts[indexPath.section]
        let comments = (post["comments"] as? [PFObject]) ?? []
        
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
            let user = post["author"] as! PFUser
            
            cell.usernameLable.text = user.username
            cell.captionLabel.text = post["caption"] as! String
            
            let imageFile = post["image"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            
            cell.photoView.af_setImage(withURL: url)
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
            
            let comment = comments[indexPath.row - 1]
            cell.commentLabel.text = comment["text"] as! String
            
            let user = comment["Author"] as! PFUser
            cell.nameLabel.text = user.username
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let post = posts[indexPath.row]
        let comment = PFObject(className: "Comments")
        
        comment["text"] = "This is a random comment"
        comment["post"] = post
        comment["author"] = PFUser.current()!
        
        post.add(comment, forKey: "comments")
        post.saveInBackground
            {
                (success, error) in
                
                if success
                {
                    print("Comment saved")
                }
                else
                {
                    print("Error saving comment")
                }
            }
    }
    
    @IBAction func onLogoutButton(_ sender: Any)
    {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginVeiwController = main.instantiateViewController(withIdentifier: "LoginViewController")
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        delegate.window?.rootViewController = loginVeiwController
    }
}
